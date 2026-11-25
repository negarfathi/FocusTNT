#include "../../include/slicing_validator/slicing_validator.h"

static constexpr int runSeconds = 60;
static constexpr size_t traceLimit = 16 * 1024 * 1024;
static constexpr size_t stateLimit = 64 * 1024;
static constexpr int compileSeconds = 60;
static const std::string marker = "__ftnt_sv_";

static std::string read(const std::filesystem::path &p) {
    std::ifstream f(p, std::ios::binary);
    if (!f) throw std::runtime_error("Cannot read " + p.string());
    return {std::istreambuf_iterator<char>(f), {}};
}

static void write(const std::filesystem::path &p, const std::string &s) {
    std::ofstream f(p, std::ios::binary);
    if (!(f << s)) throw std::runtime_error("Cannot write " + p.string());
}

static std::string join(const std::vector<std::string> &v, const std::string &sep) {
    std::string s;
    for (const auto &x : v) {
        if (!s.empty()) s += sep;
        s += x;
    }
    return s;
}

static std::string quote(const std::string &s) {
    std::string out = "\"";
    for (unsigned char c : s) {
        if (c == '\\' || c == '"') {
            out += '\\';
            out += char(c);
        } else if (c == '\n')
            out += "\\n";
        else if (c == '\r')
            out += "\\r";
        else if (c < 32 || c >= 127) {
            char b[8];
            std::snprintf(b, sizeof b, "\\%03o", c);
            out += b;
        } else
            out += char(c);
    }
    return out + '"';
}

static std::string normalizeFunction(std::string s) {
    if (auto i = s.find("_slice"); i != std::string::npos) s.resize(i);
    return s;
}

static std::string compact(std::string s) {
    s.erase(std::remove_if(s.begin(), s.end(), [](unsigned char c) { return std::isspace(c); }), s.end());
    return s;
}

static std::unique_ptr<clang::ASTUnit> parse(const std::string &s, const std::filesystem::path &p) {
    auto a = clang::tooling::buildASTFromCodeWithArgs(s, {"-xc", "-std=gnu11", "-Wno-main-return-type", "-Wno-implicit-function-declaration", "-I" + p.parent_path().string()}, p.string());
    if (!a || a->getDiagnostics().hasErrorOccurred()) throw std::runtime_error("AST_PARSE_ERROR: " + p.string());
    return a;
}

static unsigned offset(clang::ASTContext &c, clang::SourceLocation l) {
    auto &sm = c.getSourceManager();
    if (l.isInvalid() || l.isMacroID() || !sm.isWrittenInMainFile(l)) throw std::runtime_error("UNSUPPORTED_MACRO_OR_LOCATION");
    return sm.getFileOffset(l);
}

static unsigned tokenEnd(clang::ASTContext &c, clang::SourceLocation l) {
    return offset(c, clang::Lexer::getLocForEndOfToken(l, 0, c.getSourceManager(), c.getLangOpts()));
}

static unsigned stmtEnd(clang::ASTContext &c, const clang::Stmt *s, const std::string &src) {
    auto e = tokenEnd(c, s->getEndLoc());
    if (e && (src[e - 1] == ';' || src[e - 1] == '}')) return e;
    auto next = clang::Lexer::findNextToken(s->getEndLoc(), c.getSourceManager(), c.getLangOpts());
    if (next && next->is(clang::tok::semi)) return tokenEnd(c, next->getLocation());
    return e;
}

static std::string text(clang::ASTContext &c, const clang::Stmt *s) {
    if (!s) return "";
    return clang::Lexer::getSourceText(clang::CharSourceRange::getTokenRange(s->getSourceRange()), c.getSourceManager(), c.getLangOpts()).str();
}

struct Loop {
    clang::Stmt *node;
    clang::Stmt *body;
    clang::Expr *cond;
    const clang::FunctionDecl *fn;
    unsigned line;
    std::string kind;
};

class Scan : public clang::RecursiveASTVisitor<Scan> {
    clang::ASTContext &c;
    const clang::FunctionDecl *current = nullptr;

    void add(clang::Stmt *s, clang::Stmt *b, clang::Expr *e, const char *kind) {
        auto &sm = c.getSourceManager();
        if (current && sm.isWrittenInMainFile(sm.getSpellingLoc(s->getBeginLoc())))
            loops.push_back({s, b, e, current, sm.getSpellingLineNumber(s->getBeginLoc()), kind});
    }

public:
    std::vector<Loop> loops;
    bool residualNondet = false;

    explicit Scan(clang::ASTContext &ctx)
        : c(ctx) {}

    bool TraverseFunctionDecl(clang::FunctionDecl *f) {
        auto old = current;
        if (f->doesThisDeclarationHaveABody()) current = f;
        bool ok = clang::RecursiveASTVisitor<Scan>::TraverseFunctionDecl(f);
        current = old;
        return ok;
    }

    bool VisitForStmt(clang::ForStmt *s) {
        add(s, s->getBody(), s->getCond(), "for");
        return true;
    }

    bool VisitWhileStmt(clang::WhileStmt *s) {
        add(s, s->getBody(), s->getCond(), "while");
        return true;
    }

    bool VisitDoStmt(clang::DoStmt *s) {
        add(s, s->getBody(), s->getCond(), "do-while");
        return true;
    }

    bool VisitCallExpr(clang::CallExpr *e) {
        if (auto *f = e->getDirectCallee(); f && c.getSourceManager().isWrittenInMainFile(e->getExprLoc()) && f->getNameAsString().starts_with("__VERIFIER_nondet_")) residualNondet = true;
        return true;
    }
};

struct Analysis {
    std::unique_ptr<clang::ASTUnit> ast;
    std::vector<Loop> loops;
    std::vector<LoopDescriptor> criteria;
    std::vector<NondetInput> inputs;
};

static Analysis inspect(const std::string &s, const std::filesystem::path &p) {
    Analysis a;
    a.ast = parse(s, p);
    auto &c = a.ast->getASTContext();
    Scan scan(c);
    scan.TraverseDecl(c.getTranslationUnitDecl());
    a.loops = std::move(scan.loops);
    clang::Rewriter rw(c.getSourceManager(), c.getLangOpts());
    slicer::VisitorAndRewriter criterion(&c, rw, a.criteria);
    criterion.TraverseDecl(c.getTranslationUnitDecl());
    if (a.loops.size() != a.criteria.size()) throw std::runtime_error("LOOP_DESCRIPTOR_MISMATCH");
    for (size_t i = 0; i < a.loops.size(); ++i)
        if (std::to_string(a.loops[i].line) != a.criteria[i].lineNumber) throw std::runtime_error("LOOP_DESCRIPTOR_ORDER_MISMATCH");
    nondet_extractor::VisitorAndRewriter nd(&c, a.inputs);
    nd.TraverseDecl(c.getTranslationUnitDecl());
    return a;
}

static std::string concretize(const std::string &s, const std::filesystem::path &p, std::vector<NondetAssignment> values, size_t index) {
    auto ast = parse(s, p);
    auto &c = ast->getASTContext();
    clang::Rewriter rw(c.getSourceManager(), c.getLangOpts());
    std::string id = std::to_string(index);
    concretizer::VisitorAndRewriter visitor(&c, rw, values, id);
    visitor.TraverseDecl(c.getTranslationUnitDecl());
    if (auto *b = rw.getRewriteBufferFor(c.getSourceManager().getMainFileID())) return {b->begin(), b->end()};
    return s;
}

static std::vector<std::string> csvLine(const std::string &line) {
    std::vector<std::string> r;
    std::string f;
    bool q = false;
    for (size_t i = 0; i < line.size(); ++i) {
        char c = line[i];
        if (c == '"') {
            if (q && i + 1 < line.size() && line[i + 1] == '"') {
                f += '"';
                ++i;
            } else
                q = !q;
        } else if (c == ',' && !q) {
            r.push_back(f);
            f.clear();
        } else if (c != '\r' || q)
            f += c;
    }
    if (q) throw std::runtime_error("Unsupported multiline or malformed CSV field");
    r.push_back(f);
    return r;
}

struct Test {
    size_t id;
    std::vector<NondetAssignment> values;
    std::string label, description;
};

static std::vector<Test> tests(const std::filesystem::path &p) {
    std::ifstream f(p);
    std::string l;
    if (!std::getline(f, l)) throw std::runtime_error("Missing/empty test_cases.csv");
    auto header = csvLine(l);
    std::vector<Test> out;
    if (std::set<std::string>(header.begin(), header.end()).size() != header.size()) throw std::runtime_error("Duplicate CSV header");
    while (std::getline(f, l)) {
        if (l.empty() || l == "\r") continue;
        auto v = csvLine(l);
        if (v.size() != header.size()) throw std::runtime_error("Malformed test case row");
        Test t{out.size() + 1, {}, {}, {}};
        std::vector<std::string> d;
        for (size_t i = 0; i < v.size(); ++i)
            if (header[i] == "Label")
                t.label = v[i];
            else {
                t.values.push_back({header[i], v[i]});
                d.push_back(header[i] + " = " + v[i]);
            }
        t.description = "Test Case " + std::to_string(t.id) + " | Label: " + t.label + "\n" + join(d, "\n");
        out.push_back(std::move(t));
    }
    if (out.empty()) throw std::runtime_error("No test inputs");
    return out;
}

static std::string keyBase(const std::string &id) {
    return id.substr(0, id.rfind(':'));
}

static void verifyInputs(const Analysis &original, const Analysis &variant, const Test &test, bool sliced) {
    std::map<std::string, int> a, b;
    for (auto &i : original.inputs) ++a[keyBase(i.id)];
    for (auto &i : variant.inputs) ++b[keyBase(i.id)];
    for (auto &i : variant.inputs) {
        if (std::none_of(test.values.begin(), test.values.end(), [&](auto &x) { return x.id == i.id && !x.value.empty(); })) throw std::runtime_error("MISSING_TEST_VALUE: " + i.id);
        if (sliced && (a[keyBase(i.id)] != b[keyBase(i.id)] || b[keyBase(i.id)] > 1))
            throw std::runtime_error("AMBIGUOUS_NONDET_MAPPING: " + i.id);
    }
}

static std::optional<size_t> locate(const Analysis &a, unsigned line) {
    std::optional<size_t> found;
    for (size_t i = 0; i < a.loops.size(); ++i)
        if (a.loops[i].line == line) {
            if (found) throw std::runtime_error("AMBIGUOUS_ORIGINAL_LOOP_LINE");
            found = i;
        }
    return found;
}

static std::set<std::string> names(const LoopDescriptor &d) {
    std::set<std::string> out;
    for (auto &v : d.conditionVariables) out.insert(compact(v));
    return out;
}

static void mappingNames(clang::ASTContext &c, const clang::Expr *e, std::set<std::string> &out) {
    if (!e) return;
    e = e->IgnoreParenImpCasts();
    if (auto *d = llvm::dyn_cast<clang::DeclRefExpr>(e)) {
        if (auto *v = llvm::dyn_cast<clang::VarDecl>(d->getDecl())) out.insert(v->getNameAsString());
    } else if (auto *a = llvm::dyn_cast<clang::ArraySubscriptExpr>(e))
        mappingNames(c, a->getBase(), out);
    else if (auto *m = llvm::dyn_cast<clang::MemberExpr>(e))
        out.insert(compact(text(c, m)));
    else if (auto *cast = llvm::dyn_cast<clang::CastExpr>(e))
        mappingNames(c, cast->getSubExpr(), out);
    else if (auto *u = llvm::dyn_cast<clang::UnaryOperator>(e))
        mappingNames(c, u->getSubExpr(), out);
    else if (auto *b = llvm::dyn_cast<clang::BinaryOperator>(e)) {
        mappingNames(c, b->getLHS(), out);
        mappingNames(c, b->getRHS(), out);
    }
}

static std::set<std::string> mappingNames(const Analysis &a, size_t i) {
    auto out = names(a.criteria[i]);
    mappingNames(a.ast->getASTContext(), a.loops[i].cond, out);
    return out;
}

static size_t mapLoop(const Analysis &a, size_t oi, const Analysis &b) {
    const auto &o = a.loops[oi];
    auto wanted = mappingNames(a, oi);
    std::vector<size_t> exact, similar, all;
    auto condition = compact(text(a.ast->getASTContext(), o.cond));
    for (size_t i = 0; i < b.loops.size(); ++i) {
        auto &l = b.loops[i];
        if (normalizeFunction(l.fn->getNameAsString()) != normalizeFunction(o.fn->getNameAsString())) continue;
        all.push_back(i);
        if (mappingNames(b, i) == wanted) {
            similar.push_back(i);
            if (compact(text(b.ast->getASTContext(), l.cond)) == condition) exact.push_back(i);
        }
    }
    size_t originalExact = 0, originalSimilar = 0;
    for (size_t i = 0; i < a.loops.size(); ++i)
        if (a.loops[i].fn == o.fn && mappingNames(a, i) == wanted) {
            ++originalSimilar;
            if (compact(text(a.ast->getASTContext(), a.loops[i].cond)) == condition) ++originalExact;
        }
    if (exact.size() == 1 && originalExact == 1) return exact[0];
    if (exact.empty() && similar.size() == 1 && originalSimilar == 1) return similar[0];
    throw std::runtime_error(all.empty() ? "TARGET_LOOP_NOT_FOUND_IN_SLICE" : "UNRESOLVED_LOOP_MAPPING");
}

struct Observed {
    const clang::Expr *expr = nullptr;
    const clang::VarDecl *base = nullptr;
    bool dereferenced = false;
};

static const clang::VarDecl *baseDecl(const clang::Expr *e) {
    if (!e) return nullptr;
    e = e->IgnoreParenImpCasts();
    if (auto *d = llvm::dyn_cast<clang::DeclRefExpr>(e)) return llvm::dyn_cast<clang::VarDecl>(d->getDecl());
    if (auto *m = llvm::dyn_cast<clang::MemberExpr>(e); m && !m->isArrow()) return baseDecl(m->getBase());
    return nullptr;
}

static void findObserved(clang::ASTContext &c, const clang::Expr *e, std::map<std::string, Observed> &out, bool dereferenced = false) {
    if (!e) return;
    e = e->IgnoreParenImpCasts();
    if (auto *d = llvm::dyn_cast<clang::DeclRefExpr>(e)) {
        if (auto *v = llvm::dyn_cast<clang::VarDecl>(d->getDecl())) {
            auto &o = out.try_emplace(v->getNameAsString(), Observed{e, v, dereferenced}).first->second;
            o.dereferenced |= dereferenced;
        }
    } else if (auto *a = llvm::dyn_cast<clang::ArraySubscriptExpr>(e))
        findObserved(c, a->getBase(), out, true);
    else if (auto *m = llvm::dyn_cast<clang::MemberExpr>(e))
        out.emplace(compact(text(c, m)), Observed{e, baseDecl(e)});
    else if (auto *cast = llvm::dyn_cast<clang::CastExpr>(e))
        findObserved(c, cast->getSubExpr(), out, dereferenced);
    else if (auto *u = llvm::dyn_cast<clang::UnaryOperator>(e))
        findObserved(c, u->getSubExpr(), out, dereferenced || u->getOpcode() == clang::UO_Deref);
    else if (auto *b = llvm::dyn_cast<clang::BinaryOperator>(e)) {
        findObserved(c, b->getLHS(), out, dereferenced);
        findObserved(c, b->getRHS(), out, dereferenced);
    }
}

static bool directAssignment(const clang::Stmt *s, const clang::VarDecl *v) {
    if (auto *b = llvm::dyn_cast<clang::BinaryOperator>(s); b && b->getOpcode() == clang::BO_Assign)
        return baseDecl(b->getLHS()) == v && llvm::isa<clang::DeclRefExpr>(b->getLHS()->IgnoreParenImpCasts());
    return false;
}

static bool initialized(clang::ASTContext &c, const Loop &l, const clang::VarDecl *v) {
    if (!v) return false;
    if (llvm::isa<clang::ParmVarDecl>(v) || v->hasGlobalStorage() || v->hasInit()) return true;
    if (auto *f = llvm::dyn_cast<clang::ForStmt>(l.node); f && f->getInit() && directAssignment(f->getInit(), v)) return true;
    const clang::Stmt *child = l.node;
    while (child) {
        auto p = c.getParents(*child);
        if (p.size() != 1) break;
        if (auto *block = p[0].get<clang::CompoundStmt>()) {
            for (auto *s : block->body()) {
                if (s == child) break;
                if (directAssignment(s, v)) return true;
            }
        }
        child = p[0].get<clang::Stmt>();
    }
    return false;
}

static std::vector<const clang::Stmt *> precedingStatements(clang::ASTContext &c, const Loop &l) {
    std::vector<std::vector<const clang::Stmt *>> levels;
    const clang::Stmt *child = l.node;
    while (child) {
        auto parents = c.getParents(*child);
        if (parents.size() != 1) break;
        if (auto *block = parents[0].get<clang::CompoundStmt>()) {
            std::vector<const clang::Stmt *> level;
            for (auto *st : block->body()) {
                if (st == child) break;
                level.push_back(st);
            }
            levels.push_back(std::move(level));
        }
        child = parents[0].get<clang::Stmt>();
    }
    std::vector<const clang::Stmt *> result;
    for (auto i = levels.rbegin(); i != levels.rend(); ++i) result.insert(result.end(), i->begin(), i->end());
    return result;
}

static std::optional<uint64_t> constantIndex(clang::ASTContext &c, const clang::Expr *e) {
    clang::Expr::EvalResult value;
    if (!e || !e->EvaluateAsInt(value, c) || value.Val.getInt().isNegative() || value.Val.getInt().getActiveBits() > 64) return {};
    return value.Val.getInt().getLimitedValue();
}

static bool arrayInitialized(clang::ASTContext &c, const Loop &l, const clang::VarDecl *array) {
    if (initialized(c, l, array)) return true;
    auto *type = c.getAsConstantArrayType(array->getType());
    if (!type || type->getElementType()->isArrayType() || type->getSize().getLimitedValue() > 65536 || text(c, l.fn->getBody()).find("goto") != std::string::npos) return false;
    size_t size = type->getSize().getLimitedValue();
    std::vector<bool> written(size, false);
    auto assignment = [&](const clang::Stmt *st, const clang::VarDecl *index) -> const clang::ArraySubscriptExpr * {
        auto *expr = llvm::dyn_cast<clang::BinaryOperator>(st);
        if (!expr || expr->getOpcode() != clang::BO_Assign || !expr->getRHS()->isEvaluatable(c)) return nullptr;
        auto *sub = llvm::dyn_cast<clang::ArraySubscriptExpr>(expr->getLHS()->IgnoreParenImpCasts());
        if (!sub || baseDecl(sub->getBase()) != array || (index && baseDecl(sub->getIdx()) != index)) return nullptr;
        return sub;
    };
    for (auto *st : precedingStatements(c, l)) {
        if (auto *sub = assignment(st, nullptr)) {
            auto index = constantIndex(c, sub->getIdx());
            if (index && *index < size) written[*index] = true;
        }
        auto *loop = llvm::dyn_cast<clang::ForStmt>(st);
        if (!loop || !loop->getInit() || !loop->getCond() || !loop->getInc()) continue;
        const clang::VarDecl *index = nullptr;
        const clang::Expr *initial = nullptr;
        if (auto *decl = llvm::dyn_cast<clang::DeclStmt>(loop->getInit()); decl && decl->isSingleDecl()) {
            index = llvm::dyn_cast<clang::VarDecl>(decl->getSingleDecl());
            if (index) initial = index->getInit();
        } else if (auto *expr = llvm::dyn_cast<clang::BinaryOperator>(loop->getInit()); expr && expr->getOpcode() == clang::BO_Assign) {
            index = baseDecl(expr->getLHS());
            initial = expr->getRHS();
        }
        auto *cond = llvm::dyn_cast<clang::BinaryOperator>(loop->getCond()->IgnoreParenImpCasts());
        auto *inc = llvm::dyn_cast<clang::UnaryOperator>(loop->getInc()->IgnoreParenImpCasts());
        if (!index || constantIndex(c, initial) != std::optional<uint64_t>(0) || !cond || !inc || !inc->isIncrementOp() || baseDecl(inc->getSubExpr()) != index || baseDecl(cond->getLHS()) != index || (cond->getOpcode() != clang::BO_LT && cond->getOpcode() != clang::BO_LE)) continue;
        auto limit = constantIndex(c, cond->getRHS());
        if (!limit || *limit > size || (cond->getOpcode() == clang::BO_LE && *limit == size)) continue;
        size_t end = *limit + (cond->getOpcode() == clang::BO_LE ? 1 : 0);
        if (!index->getType()->isIntegerType() || index->getType().isVolatileQualified() || c.getTypeSize(index->getType()) < 32) continue;
        const clang::Stmt *body = loop->getBody();
        if (auto *block = llvm::dyn_cast<clang::CompoundStmt>(body); block && block->size() == 1) body = *block->body_begin();
        if (assignment(body, index)) std::fill(written.begin(), written.begin() + end, true);
    }
    return std::all_of(written.begin(), written.end(), [](bool v) { return v; });
}

static const clang::Expr *assignedValue(clang::ASTContext &c, const Loop &l, const clang::VarDecl *v) {
    const clang::Expr *value = v->getInit();
    for (auto *st : precedingStatements(c, l))
        if (directAssignment(st, v)) value = llvm::cast<clang::BinaryOperator>(st)->getRHS();
    return value;
}

static const clang::VarDecl *arrayOrigin(clang::ASTContext &c, const Loop &l, const clang::VarDecl *v) {
    auto *expr = assignedValue(c, l, v);
    auto *array = baseDecl(expr);
    if (!array || !array->getType()->isArrayType() || array->getType().isVolatileQualified()) return nullptr;
    auto *type = c.getAsArrayType(array->getType());
    if (!llvm::isa<clang::ConstantArrayType>(type) && !llvm::isa<clang::VariableArrayType>(type)) return nullptr;
    bool visible = array->isFileVarDecl();
    for (auto *st : precedingStatements(c, l))
        if (auto *ds = llvm::dyn_cast<clang::DeclStmt>(st))
            for (auto *d : ds->decls()) if (d == array) visible = true;
    return visible ? array : nullptr;
}

class PointerFieldUse : public clang::RecursiveASTVisitor<PointerFieldUse> {
    clang::ASTContext &c;
    const clang::VarDecl *v;
    const clang::Expr *allocation;
public:
    bool safe = true;
    PointerFieldUse(clang::ASTContext &c, const clang::VarDecl *v, const clang::Expr *allocation) : c(c), v(v), allocation(allocation) {}
    bool VisitDeclRefExpr(clang::DeclRefExpr *e) {
        if (e->getDecl() != v) return true;
        const clang::Stmt *child = e;
        while (child) {
            auto parents = c.getParents(*child);
            if (parents.size() != 1) break;
            if (auto *m = parents[0].get<clang::MemberExpr>(); m && m->isArrow() && m->getBase() == child) return true;
            if (auto *b = parents[0].get<clang::BinaryOperator>(); b && b->getOpcode() == clang::BO_Assign && b->getLHS() == child && b->getRHS() == allocation) return true;
            child = parents[0].get<clang::ImplicitCastExpr>();
        }
        safe = false;
        return true;
    }
};

static bool safePointerField(clang::ASTContext &c, const Loop &l, const clang::MemberExpr *member, const clang::VarDecl *ptr) {
    if (!ptr || !ptr->hasLocalStorage() || llvm::isa<clang::ParmVarDecl>(ptr) || ptr->getType().isVolatileQualified() || !ptr->getType()->isPointerType()) return false;
    auto pointee = ptr->getType()->getPointeeType();
    if (!pointee->isStructureType() || pointee.isVolatileQualified() || pointee->isIncompleteType()) return false;
    auto *value = assignedValue(c, l, ptr);
    if (!value) return false;
    auto *expr = value->IgnoreParenImpCasts();
    while (auto *cast = llvm::dyn_cast<clang::CastExpr>(expr)) expr = cast->getSubExpr()->IgnoreParenImpCasts();
    auto *call = llvm::dyn_cast<clang::CallExpr>(expr);
    if (!call || !call->getDirectCallee() || call->getDirectCallee()->getNameAsString() != "malloc" || call->getNumArgs() != 1) return false;
    clang::Expr::EvalResult bytes;
    if (!call->getArg(0)->EvaluateAsInt(bytes, c) || bytes.Val.getInt().getLimitedValue() < static_cast<uint64_t>(c.getTypeSizeInChars(pointee).getQuantity())) return false;
    bool fieldAssigned = false;
    for (auto *st : precedingStatements(c, l))
        if (auto *b = llvm::dyn_cast<clang::BinaryOperator>(st); b && b->getOpcode() == clang::BO_Assign) {
            if (directAssignment(st, ptr)) fieldAssigned = false;
            if (auto *m = llvm::dyn_cast<clang::MemberExpr>(b->getLHS()->IgnoreParenImpCasts()); m && m->isArrow() && m->getMemberDecl() == member->getMemberDecl() && baseDecl(m->getBase()) == ptr) fieldAssigned = true;
        }
    if (!fieldAssigned) return false;
    PointerFieldUse use(c, ptr, value);
    use.TraverseStmt(const_cast<clang::Stmt *>(l.fn->getBody()));
    return use.safe;
}

static std::string emit(const std::string &e, clang::QualType t, clang::ASTContext &c, unsigned depth = 0) {
    if (t.isVolatileQualified() || t->isAtomicType()) return "__ftnt_sv_text(\"<volatile/atomic unavailable>\");\n";
    if (c.getAsArrayType(t)) {
        auto *a = c.getAsArrayType(t);
        if (!llvm::isa<clang::ConstantArrayType>(a) && !llvm::isa<clang::VariableArrayType>(a)) return "__ftnt_sv_text(\"<unknown array extent>\");\n";
        std::string i = marker + "i" + std::to_string(depth), x = "(" + e + ")";
        return "__ftnt_sv_text(\"[\");\nfor (size_t " + i + "=0; " + i + "<sizeof(" + x + ")/sizeof(" + x + "[0]) && __ftnt_sv_room(); ++" + i + ") {\nif (" + i + ") __ftnt_sv_text(\", \" );\n" + emit(x + "[" + i + "]", a->getElementType(), c, depth + 1) + "}\n__ftnt_sv_text(\"]\");\n";
    }
    if (t->isPointerType()) return "__ftnt_sv_pointer((const void *)(" + e + "));\n";
    if (t->isBooleanType()) return "__ftnt_sv_signed((long long)(" + e + "));\n";
    if (t->isIntegralOrEnumerationType()) {
        if (c.getTypeSize(t) > 64) return "__ftnt_sv_text(\"<integer wider than 64 bits unavailable>\");\n";
        if (t->isUnsignedIntegerOrEnumerationType()) return "__ftnt_sv_unsigned((unsigned long long)(" + e + "));\n";
        return "__ftnt_sv_signed((long long)(" + e + "));\n";
    }
    if (t->isRealFloatingType()) return "__ftnt_sv_float((long double)(" + e + "));\n";
    return "__ftnt_sv_text(\"<unsupported type>\");\n";
}

static std::string runtime = R"SV(
#include <stdio.h>
#include <stdlib.h>
#include <stddef.h>
#include <stdint.h>
#include <sys/mman.h>
#define __ftnt_sv_capacity (16u * 1024u * 1024u)
#define __ftnt_sv_state_capacity (64u * 1024u)
#define __ftnt_sv_data_offset (64u + 2u * __ftnt_sv_state_capacity)
static uint64_t *__ftnt_sv_map;
static char __ftnt_sv_buffer[__ftnt_sv_state_capacity];
static size_t __ftnt_sv_length;
static int __ftnt_sv_overflow;
static const char *__ftnt_sv_phase;
static unsigned long long __ftnt_sv_current;
static uint64_t *__ftnt_sv_last;
static void __ftnt_sv_store(uint64_t *p, uint64_t v) { __atomic_store_n(p, v, __ATOMIC_RELEASE); }
static void __ftnt_sv_open(void) {
    if (!__ftnt_sv_map) {
        const char *p = getenv("FOCUSTNT_SV_TRACE");
        FILE *f = p ? fopen(p, "r+b") : NULL;
        if (!f) _Exit(120);
        void *m = mmap(NULL, __ftnt_sv_capacity, PROT_READ | PROT_WRITE, MAP_SHARED, fileno(f), 0);
        fclose(f);
        if (m == MAP_FAILED) _Exit(120);
        __ftnt_sv_map = (uint64_t *)m;
        __ftnt_sv_store(__ftnt_sv_map, 0x5356545241434531ULL);
    }
}
int __ftnt_sv_room(void) { return !__ftnt_sv_overflow; }
void __ftnt_sv_text(const char *s) {
    size_t n = __builtin_strlen(s);
    if (__ftnt_sv_overflow || n > sizeof(__ftnt_sv_buffer) - __ftnt_sv_length) { __ftnt_sv_overflow = 1; return; }
    __builtin_memcpy(__ftnt_sv_buffer + __ftnt_sv_length, s, n);
    __ftnt_sv_length += n;
}
void __ftnt_sv_signed(long long v) { char b[32]; snprintf(b, sizeof b, "%lld", v); __ftnt_sv_text(b); }
void __ftnt_sv_unsigned(unsigned long long v) { char b[32]; snprintf(b, sizeof b, "%llu", v); __ftnt_sv_text(b); }
void __ftnt_sv_float(long double v) { char b[128]; snprintf(b, sizeof b, "%La", v); __ftnt_sv_text(b); }
void __ftnt_sv_pointer(const void *v) {
    if (!v) __ftnt_sv_text("NULL"); else { char b[80]; snprintf(b, sizeof b, "NON_NULL(address=%p)", (void *)v); __ftnt_sv_text(b); }
}
int __ftnt_sv_array_pointer(const void *v, const void *base, size_t size, const char *name) {
    uintptr_t p = (uintptr_t)v, b = (uintptr_t)base;
    if (!v) { __ftnt_sv_text("NULL"); return 0; }
    if (p < b || p - b > size) { __ftnt_sv_pointer(v); return 0; }
    __ftnt_sv_text("PTR("); __ftnt_sv_text(name); __ftnt_sv_text("+"); __ftnt_sv_unsigned(p - b); __ftnt_sv_text(")");
    return p - b < size;
}
void __ftnt_sv_begin(const char *phase, unsigned long long iteration) {
    __ftnt_sv_open();
    __ftnt_sv_phase = phase; __ftnt_sv_current = iteration; __ftnt_sv_length = 0; __ftnt_sv_overflow = 0;
    if (phase[0] == 'T') __ftnt_sv_store(__ftnt_sv_map + 1, 1);
    if (phase[0] == 'I') __ftnt_sv_store(__ftnt_sv_map + 2, iteration);
    if (phase[0] == 'I' && __ftnt_sv_map[4]) __ftnt_sv_overflow = 1;
}
void __ftnt_sv_end(void) {
    uint64_t *h = __ftnt_sv_map;
    char *base = (char *)h;
    const char *p = __ftnt_sv_buffer;
    size_t n = __ftnt_sv_length;
    if (__ftnt_sv_overflow) { p = " | <unavailable>=<snapshot exceeds capacity>"; n = __builtin_strlen(p); }
    if (__ftnt_sv_phase[0] == 'T') return;
    if (__ftnt_sv_phase[0] == 'B' || __ftnt_sv_phase[0] == 'A') {
        size_t slot = __ftnt_sv_phase[0] == 'B' ? 0 : 1;
        __builtin_memcpy(base + 64 + slot * __ftnt_sv_state_capacity, p, n);
        __ftnt_sv_store(h + 5 + slot, n + 1);
    } else if (__ftnt_sv_phase[0] == 'I') {
        if (h[4]) return;
        if (__ftnt_sv_last && __ftnt_sv_last[2] == n && !__builtin_memcmp((char *)__ftnt_sv_last + 64, p, n)) {
            __ftnt_sv_store(__ftnt_sv_last + 1, __ftnt_sv_current);
            return;
        }
        size_t bytes = (64 + n + 7) & ~(size_t)7;
        if (bytes > __ftnt_sv_capacity - __ftnt_sv_data_offset - h[3]) { __ftnt_sv_store(h + 4, 1); return; }
        uint64_t *r = (uint64_t *)(base + __ftnt_sv_data_offset + h[3]);
        r[0] = r[1] = __ftnt_sv_current; r[2] = n;
        __builtin_memcpy((char *)r + 64, p, n);
        __ftnt_sv_store(h + 3, h[3] + bytes);
        __ftnt_sv_last = r;
    } else if (__ftnt_sv_phase[0] == 'L') {
        __ftnt_sv_store(h + 7, !__builtin_strcmp(__ftnt_sv_phase, "LOOP_EXITED_RETURN") ? 2 : !__builtin_strcmp(__ftnt_sv_phase, "LOOP_EXITED_GOTO") ? 3 : 1);
    }
}
)SV";

static const std::string runtimeDeclarations = R"SV(
#include <stddef.h>
#include <stdint.h>
#include <stdlib.h>
void __ftnt_sv_text(const char *s);
void __ftnt_sv_signed(long long v);
void __ftnt_sv_unsigned(unsigned long long v);
void __ftnt_sv_float(long double v);
void __ftnt_sv_pointer(const void *v);
int __ftnt_sv_array_pointer(const void *v, const void *base, size_t size, const char *name);
int __ftnt_sv_room(void);
void __ftnt_sv_begin(const char *phase, unsigned long long iteration);
void __ftnt_sv_end(void);
)SV";

struct Edit {
    unsigned begin, end;
    std::string value;
};

class Transfers : public clang::RecursiveASTVisitor<Transfers> {
public:
    std::vector<clang::ReturnStmt *> returns;
    std::vector<clang::GotoStmt *> gotos;
    bool indirect = false;

    bool VisitReturnStmt(clang::ReturnStmt *s) {
        returns.push_back(s);
        return true;
    }

    bool VisitGotoStmt(clang::GotoStmt *s) {
        gotos.push_back(s);
        return true;
    }

    bool VisitIndirectGotoStmt(clang::IndirectGotoStmt *) {
        indirect = true;
        return true;
    }
};

static std::string instrument(const std::string &s, const std::filesystem::path &p, size_t target, size_t expected, const std::vector<std::string> &vars) {
    if (s.find(marker) != std::string::npos) throw std::runtime_error("INSTRUMENTATION_NAME_COLLISION");
    auto ast = parse(s, p);
    auto &c = ast->getASTContext();
    Scan scan(c);
    scan.TraverseDecl(c.getTranslationUnitDecl());
    if (scan.residualNondet) throw std::runtime_error("UNRESOLVED_NONDETERMINISTIC_CALL");
    if (scan.loops.size() != expected || target >= scan.loops.size()) throw std::runtime_error("LOOP_CHANGED_DURING_CONCRETIZATION");
    auto &l = scan.loops[target];
    auto begin = offset(c, l.node->getBeginLoc()), end = stmtEnd(c, l.node, s);
    std::map<std::string, Observed> observed;
    findObserved(c, l.cond, observed);
    std::string values;
    for (auto &v : vars) {
        values += "__ftnt_sv_text(" + quote(" | " + v + "=") + ");\n";
        auto it = observed.find(compact(v));
        if (it == observed.end()) {
            values += "__ftnt_sv_text(\"<unavailable: not in concrete condition>\");\n";
            continue;
        }
        auto &o = it->second;
        if (auto *m = llvm::dyn_cast<clang::MemberExpr>(o.expr); m && m->isArrow()) {
            auto *ptr = baseDecl(m->getBase());
            if (safePointerField(c, l, m, ptr)) {
                values += "if (" + ptr->getNameAsString() + ") {\n" + emit(v, o.expr->getType(), c) + "} else __ftnt_sv_text(\"<null pointer member>\");\n";
                continue;
            }
            values += "__ftnt_sv_text(\"<pointer member not dereferenced; base=\");\n";
            if (ptr && initialized(c, l, ptr) && !ptr->getType().isVolatileQualified() && ptr->getType()->isPointerType())
                values += emit(ptr->getNameAsString(), ptr->getType(), c);
            else
                values += "__ftnt_sv_text(\"unavailable\");\n";
            values += "__ftnt_sv_text(\">\");\n";
            continue;
        }
        if (!o.base || !(o.base->getType()->isArrayType() ? arrayInitialized(c, l, o.base) : initialized(c, l, o.base))) {
            values += "__ftnt_sv_text(\"<unavailable: initialization or safe access not established>\");\n";
            continue;
        }
        if (llvm::isa<clang::MemberExpr>(o.expr) && !o.base->hasInit() && !o.base->hasGlobalStorage()) {
            values += "__ftnt_sv_text(\"<unavailable: field initialization unknown>\");\n";
            continue;
        }
        if (o.expr->getType()->isPointerType() && !o.expr->getType().isVolatileQualified() && llvm::isa<clang::DeclRefExpr>(o.expr)) {
            if (auto *array = arrayOrigin(c, l, o.base)) {
                std::string name = array->getNameAsString();
                auto element = c.getAsArrayType(array->getType())->getElementType();
                auto pointee = o.expr->getType()->getPointeeType();
                bool readable = !element.isVolatileQualified() && !pointee.isVolatileQualified() && c.hasSameUnqualifiedType(element, pointee) && !element->isArrayType() && arrayInitialized(c, l, array);
                values += "if (__ftnt_sv_array_pointer((const void *)(" + v + "), (const void *)(" + name + "), sizeof(" + name + "), " + quote(name) + ")) {\n";
                if (o.dereferenced) {
                    if (readable) {
                        auto index = "((uintptr_t)(" + v + ")-(uintptr_t)(" + name + "))";
                        values += "if (" + index + " % sizeof(" + name + "[0]) == 0) {\n__ftnt_sv_text(\";value=\");\n" + emit(name + "[" + index + "/sizeof(" + name + "[0])]", element, c) + "} else __ftnt_sv_text(\"<unaligned pointer>\");\n";
                    } else values += "__ftnt_sv_text(\"<pointee unavailable>\");\n";
                }
                values += "}\n";
                continue;
            }
        }
        values += emit(v, o.expr->getType(), c);
    }
    auto snapshot = [&](const std::string &phase) {
        return "\n__ftnt_sv_begin(" + quote(phase) + ", __ftnt_sv_iteration);\nif (__ftnt_sv_room()) {\n" + values + "}\n__ftnt_sv_end();\n";
    };
    std::vector<Edit> edits;
    std::map<unsigned, std::string, std::greater<unsigned>> insert;
    std::string hoisted;
    if (auto *f = llvm::dyn_cast<clang::ForStmt>(l.node); f && f->getInit()) {
        auto a = tokenEnd(c, f->getLParenLoc()), b = stmtEnd(c, f->getInit(), s);
        if (b <= a || s[b - 1] != ';') throw std::runtime_error("UNSUPPORTED_FOR_INITIALIZER");
        hoisted = s.substr(a, b - a) + "\n";
        edits.push_back({a, b, ";"});
    }
    insert[begin] += "{\n" + std::string("__ftnt_sv_begin(\"TARGET_LOOP_REACHED\", 0); __ftnt_sv_end();\n") + hoisted + "unsigned long long __ftnt_sv_iteration=0;\nconst char *__ftnt_sv_reason=\"LOOP_EXITED\";\n" + snapshot("BEFORE");
    auto inside = "\n++__ftnt_sv_iteration;\n" + snapshot("INSIDE");
    if (auto *block = llvm::dyn_cast<clang::CompoundStmt>(l.body))
        insert[tokenEnd(c, block->getLBracLoc())] += inside;
    else {
        insert[offset(c, l.body->getBeginLoc())] += "{\n" + inside;
        insert[stmtEnd(c, l.body, s)] += "\n}\n";
    }
    Transfers transfers;
    transfers.TraverseStmt(const_cast<clang::Stmt *>(l.fn->getBody()));
    if (transfers.indirect) throw std::runtime_error("UNSUPPORTED_INDIRECT_GOTO");
    auto within = [&](unsigned pos) { return pos >= begin && pos < end; };
    auto replaceTransfer = [&](clang::Stmt *st, const char *reason) {
        auto a = offset(c, st->getBeginLoc()), b = stmtEnd(c, st, s);
        edits.push_back({a, b, "{ __ftnt_sv_reason=" + quote(reason) + "; goto __ftnt_sv_loop_exit; }"});
    };
    for (auto *r : transfers.returns)
        if (within(offset(c, r->getBeginLoc()))) {
            auto a = offset(c, r->getBeginLoc()), b = stmtEnd(c, r, s);
            std::string evaluate = r->getRetValue() ? "(void)(" + text(c, r->getRetValue()) + "); " : "";
            edits.push_back({a, b, "{ " + evaluate + "__ftnt_sv_reason=\"LOOP_EXITED_RETURN\"; goto __ftnt_sv_loop_exit; }"});
        }
    for (auto *decl : c.getTranslationUnitDecl()->decls()) {
        auto *fn = llvm::dyn_cast<clang::FunctionDecl>(decl);
        if (!fn || !fn->isMain() || !fn->doesThisDeclarationHaveABody() || !fn->getReturnType()->isVoidType()) continue;
        auto range = fn->getReturnTypeSourceRange();
        edits.push_back({offset(c, range.getBegin()), tokenEnd(c, range.getEnd()), "int"});
        Transfers mainTransfers;
        mainTransfers.TraverseStmt(fn->getBody());
        for (auto *r : mainTransfers.returns) {
            auto a = offset(c, r->getBeginLoc());
            if (fn == l.fn && within(a)) continue;
            std::string value = r->getRetValue() ? "{ (void)(" + text(c, r->getRetValue()) + "); return 0; }" : "return 0;";
            edits.push_back({a, stmtEnd(c, r, s), value});
        }
    }
    for (auto *g : transfers.gotos) {
        auto a = offset(c, g->getBeginLoc()), b = offset(c, g->getLabel()->getLocation());
        if (!within(a) && within(b)) throw std::runtime_error("UNSUPPORTED_GOTO_INTO_TARGET_LOOP");
        if (within(a) && !within(b)) replaceTransfer(g, "LOOP_EXITED_GOTO");
    }
    insert[end] += "\n__ftnt_sv_loop_exit: ;\n" + snapshot("AFTER") + "__ftnt_sv_begin(__ftnt_sv_reason, __ftnt_sv_iteration); __ftnt_sv_end(); _Exit(0);\n}\n";
    for (auto &[at, str] : insert) edits.push_back({at, at, str});
    std::sort(edits.begin(), edits.end(), [](const Edit &a, const Edit &b) { return a.begin != b.begin ? a.begin > b.begin : a.end > b.end; });
    std::string result = s;
    unsigned last = s.size();
    for (auto &e : edits) {
        if (e.end > last || e.end > result.size()) throw std::runtime_error("OVERLAPPING_INSTRUMENTATION_EDITS");
        result.replace(e.begin, e.end - e.begin, e.value);
        last = e.begin;
    }
    return runtimeDeclarations + "\n" + result;
}

struct Process {
    bool timeout = false;
    int status = -1;
};

static Process execute(const std::vector<std::string> &args, const std::filesystem::path &dir, const std::filesystem::path &log, int seconds, const std::filesystem::path &trace = {}) {
    auto start = std::chrono::steady_clock::now();
    auto pid = fork();
    if (pid < 0) throw std::runtime_error("fork failed");
    if (pid == 0) {
        setpgid(0, 0);
        if (chdir(dir.c_str()) != 0) _exit(126);
        int fd = open(log.c_str(), O_WRONLY | O_CREAT | O_TRUNC, 0600), in = open("/dev/null", O_RDONLY);
        if (fd < 0 || in < 0) _exit(126);
        dup2(fd, STDOUT_FILENO);
        dup2(fd, STDERR_FILENO);
        dup2(in, STDIN_FILENO);
        close(fd);
        close(in);
        if (!trace.empty()) {
            setenv("FOCUSTNT_SV_TRACE", trace.c_str(), 1);
            struct rlimit limit{traceLimit, traceLimit};
            if (setrlimit(RLIMIT_FSIZE, &limit) != 0) _exit(126);
        }
        std::vector<char *> argv;
        for (auto &a : args) argv.push_back(const_cast<char *>(a.c_str()));
        argv.push_back(nullptr);
        execvp(argv[0], argv.data());
        _exit(127);
    }
    setpgid(pid, pid);
    int status = 0;
    while (true) {
        auto w = waitpid(pid, &status, WNOHANG);
        if (w == pid) {
            kill(-pid, SIGKILL);
            return {false, status};
        }
        if (w < 0 && errno != EINTR) {
            kill(-pid, SIGKILL);
            throw std::runtime_error("waitpid failed");
        }
        if (std::chrono::steady_clock::now() - start >= std::chrono::seconds(seconds)) {
            kill(-pid, SIGKILL);
            kill(pid, SIGKILL);
            while (waitpid(pid, &status, 0) < 0 && errno == EINTR) {}
            return {true, status};
        }
        std::this_thread::sleep_for(std::chrono::milliseconds(10));
    }
}

static std::string processStatus(const Process &p) {
    if (p.timeout) return "TIMEOUT";
    if (WIFSIGNALED(p.status)) return "RUNTIME_ERROR (signal " + std::to_string(WTERMSIG(p.status)) + ")";
    if (WIFEXITED(p.status)) return "EXIT_CODE_" + std::to_string(WEXITSTATUS(p.status));
    return "RUNTIME_ERROR";
}

struct Outcome {
    std::string status, preview, path;
    bool reached = false;
    unsigned long long count = 0, recorded = 0;
    bool capped = false;
};

static Outcome summarize(const std::filesystem::path &trace, const std::filesystem::path &binary, const Process &p) {
    std::ifstream f(binary, std::ios::binary);
    std::vector<char> data(traceLimit);
    if (!f.read(data.data(), data.size())) throw std::runtime_error("TRACE_IO_ERROR");
    f.close();
    auto word = [&](size_t pos) {
        uint64_t v;
        if (pos > data.size() - sizeof(v)) throw std::runtime_error("INVALID_TRACE");
        std::memcpy(&v, data.data() + pos, sizeof(v));
        return v;
    };
    constexpr size_t dataOffset = 64 + 2 * stateLimit;
    auto magic = word(0), reached = word(8), count = word(16), used = word(24), capped = word(32), before = word(40), after = word(48), exit = word(56);
    if ((magic != 0 && magic != 0x5356545241434531ULL) || reached > 1 || capped > 1 || used > traceLimit - dataOffset || before > stateLimit + 1 || after > stateLimit + 1 || exit > 3) throw std::runtime_error("INVALID_TRACE");
    std::ofstream out(trace);
    std::string preview, last, afterLine;
    bool clipped = false;
    auto record = [&](const std::string &line) {
        out << line << '\n';
        if (!clipped && preview.size() + line.size() + 1 < 27500) preview += line + "\n";
        else clipped = true;
    };
    auto snapshot = [&](size_t pos, size_t n) { return std::string(data.data() + pos, n); };
    if (reached) record("TARGET_LOOP_REACHED | Iteration=0");
    if (before) record("BEFORE | Iteration=0" + snapshot(64, before - 1));
    uint64_t recorded = 0;
    for (size_t pos = dataOffset; pos < dataOffset + used;) {
        auto first = word(pos), end = word(pos + 8), n = word(pos + 16);
        if (first != recorded + 1 || end < first || end > count || n > stateLimit || (64 + n + 7) / 8 * 8 > dataOffset + used - pos) throw std::runtime_error("INVALID_TRACE");
        std::string range = std::to_string(first);
        if (first != end) range += "-" + std::to_string(end);
        auto line = "INSIDE | Iteration=" + range + snapshot(pos + 64, n);
        record(line);
        last = line.substr(0, 700);
        recorded = end;
        pos += (64 + n + 7) / 8 * 8;
    }
    if (after) {
        afterLine = "AFTER | Iteration=" + std::to_string(count) + snapshot(64 + stateLimit, after - 1);
        record(afterLine);
    }
    std::string exitName = exit == 2 ? "LOOP_EXITED_RETURN" : exit == 3 ? "LOOP_EXITED_GOTO" : "LOOP_EXITED";
    if (exit) record(exitName + " | Iteration=" + std::to_string(count));
    out.close();
    if (!out) throw std::runtime_error("TRACE_IO_ERROR");
    std::filesystem::remove(binary);
    std::string status;
    if (p.timeout) status = reached ? "TIMEOUT_AFTER_REACHING_TARGET_LOOP" : "TIMEOUT_BEFORE_TARGET_LOOP";
    else if (exit && after && WIFEXITED(p.status) && WEXITSTATUS(p.status) == 0) status = exitName;
    else if (WIFEXITED(p.status) && WEXITSTATUS(p.status) == 120) status = "TRACE_IO_ERROR";
    else if (WIFEXITED(p.status) && WEXITSTATUS(p.status) == 0) status = !reached ? "LOOP_NOT_REACHED" : "PROGRAM_EXITED_BEFORE_AFTER";
    else status = processStatus(p);
    if (clipped) {
        preview += "[Trace continues in file]\n";
        if (!last.empty()) preview += "Last recorded: " + last + "\n";
        if (!afterLine.empty()) preview += afterLine.substr(0, 700) + "\n";
    }
    if (!after) preview += "AFTER: not recorded\n";
    if (!before) preview += "BEFORE: not recorded\n";
    if (capped) preview += "Trace capacity reached; subsequent inside states not stored.\n";
    else if (recorded < count) preview += "Final inside snapshot incomplete at process stop.\n";
    preview += "Iterations entered: " + std::to_string(count) + "\nIterations recorded: " + std::to_string(recorded) + "\nStatus: " + status + "\n";
    return {status, preview, trace.string(), reached != 0, count, recorded, capped != 0};
}

static Outcome runOne(const std::string &source, const std::filesystem::path &originalPath, const Analysis &original, const Analysis &variant, size_t idx, const std::vector<std::string> &vars, const Test &test, const std::filesystem::path &dir, bool sliced) {
    std::filesystem::create_directories(dir);
    auto trace = dir / "states.txt";
    write(trace, "");
    try {
        verifyInputs(original, variant, test, sliced);
        auto concrete = concretize(source, originalPath, test.values, test.id);
        write(dir / "concretized.c", concrete);
        auto code = instrument(concrete, originalPath, idx, variant.loops.size(), vars);
        auto instrumented = dir / "instrumented.c";
        write(instrumented, code);
        auto runtimePath = dir / "trace_runtime.c";
        write(runtimePath, runtime);
        auto executable = dir / "program";
        const char *cc = getenv("FOCUSTNT_SV_CC");
        auto compile = execute({cc ? cc : "clang", "-x", "c", "-std=gnu11", "-O0", "-g", "-Wno-main-return-type", "-Wno-implicit-function-declaration", "-I" + originalPath.parent_path().string(), instrumented.string(), runtimePath.string(), "-o", executable.string(), "-lm"}, dir, dir / "compile.log", compileSeconds);
        if (compile.timeout || !WIFEXITED(compile.status) || WEXITSTATUS(compile.status) != 0) {
            std::string status = compile.timeout ? "COMPILATION_TIMEOUT" : "COMPILATION_ERROR";
            return {status, "Status: " + status + "\nSee compile.log\n", trace.string()};
        }
        auto binary = dir / "states.bin";
        if (std::filesystem::space(dir).available < 4 * traceLimit) throw std::runtime_error("INSUFFICIENT_TRACE_DISK_SPACE");
        write(binary, "");
        std::filesystem::resize_file(binary, traceLimit);
        auto outcome = summarize(trace, binary, execute({executable.string()}, dir, dir / "execution.log", runSeconds, binary));
        return outcome;
    } catch (const std::exception &e) {
        return {e.what(), "Status: " + std::string(e.what()) + "\n", trace.string()};
    }
}

struct TraceRecord {
    std::string phase;
    unsigned long long iteration = 0, last = 0;
    std::map<std::string, std::string> values;
};

class TraceReader {
    std::ifstream file;
    bool seenBefore = false, seenAfter = false;
    unsigned long long lastIteration = 0;

public:
    bool invalid = false;

    explicit TraceReader(const std::string &path)
        : file(path) {
        if (!file) invalid = true;
    }

    bool next(TraceRecord &r) {
        std::string line;
        while (std::getline(file, line)) {
            if (file.eof()) break;
            auto sep = line.find(" | Iteration=");
            if (sep == std::string::npos) {
                invalid = true;
                return false;
            }
            auto phase = line.substr(0, sep);
            if (phase == "TARGET_LOOP_REACHED" || phase.starts_with("LOOP_EXITED")) continue;
            if (phase != "BEFORE" && phase != "INSIDE" && phase != "AFTER") {
                invalid = true;
                return false;
            }
            auto start = sep + 13, end = line.find(" | ", start);
            auto number = line.substr(start, end - start);
            r = {};
            r.phase = phase;
            try {
                size_t used = 0;
                r.iteration = std::stoull(number, &used);
                r.last = r.iteration;
                if (used != number.size()) {
                    if (phase != "INSIDE" || number[used] != '-') throw std::runtime_error("iteration");
                    auto tail = number.substr(used + 1);
                    r.last = std::stoull(tail, &used);
                    if (used != tail.size() || r.last < r.iteration) throw std::runtime_error("iteration");
                }
            } catch (...) {
                invalid = true;
                return false;
            }
            if (seenAfter || (phase == "BEFORE" && (seenBefore || r.iteration != 0)) ||
                (phase != "BEFORE" && !seenBefore) ||
                (phase == "INSIDE" && r.iteration != lastIteration + 1) ||
                (phase == "AFTER" && r.iteration < lastIteration)) {
                invalid = true;
                return false;
            }
            if (phase == "BEFORE") seenBefore = true;
            if (phase == "INSIDE") lastIteration = r.last;
            if (phase == "AFTER") seenAfter = true;
            while (end != std::string::npos) {
                start = end + 3;
                end = line.find(" | ", start);
                auto field = line.substr(start, end - start);
                auto eq = field.find('=');
                if (eq == std::string::npos || !r.values.emplace(field.substr(0, eq), field.substr(eq + 1)).second) {
                    invalid = true;
                    return false;
                }
            }
            return true;
        }
        if (file.bad()) invalid = true;
        return false;
    }
};

struct ValueComparison {
    bool different = false, incomplete = false;
};

static ValueComparison compareValue(const std::string &a, const std::string &b) {
    if (a.find('<') != std::string::npos || b.find('<') != std::string::npos) return {false, true};
    auto normalize = [](const std::string &s) {
        std::string out;
        size_t start = 0;
        while (true) {
            auto p = s.find("NON_NULL(address=", start);
            if (p == std::string::npos) {
                out += s.substr(start);
                break;
            }
            auto e = s.find(')', p);
            if (e == std::string::npos) {
                out += s.substr(start);
                break;
            }
            out += s.substr(start, p - start) + "NON_NULL";
            start = e + 1;
        }
        return out;
    };
    auto na = normalize(a), nb = normalize(b);
    bool unknown = na.find("NON_NULL") != std::string::npos || nb.find("NON_NULL") != std::string::npos;
    if (unknown && (na.starts_with("PTR(") || nb.starts_with("PTR("))) return {false, true};
    if (na.starts_with("PTR(") && nb.starts_with("PTR(") && na.substr(0, na.find('+')) != nb.substr(0, nb.find('+'))) return {false, true};
    return {na != nb, unknown};
}

struct Comparison {
    std::string result;
    unsigned long long compared = 0;
};

static bool exited(const Outcome &o) {
    return o.status.starts_with("LOOP_EXITED");
}

static bool timedOut(const Outcome &o) {
    return o.status.starts_with("TIMEOUT");
}

static bool validRun(const Outcome &o) {
    return exited(o) || timedOut(o) || o.status == "LOOP_NOT_REACHED";
}

static Comparison compareOutcomes(const Outcome &o, const Outcome &s) {
    Comparison c;
    if (!validRun(o) || !validRun(s)) {
        c.result = "ERROR";
        return c;
    }
    if (o.reached != s.reached) {
        c.result = o.reached ? "MISMATCH" : "ORIGINAL_NOT_REACHED";
        return c;
    }
    if (!o.reached) {
        c.result = "BOTH_NOT_REACHED";
        return c;
    }
    bool countDiff = (exited(o) && exited(s) && o.count != s.count) || (exited(o) && s.count > o.count) || (exited(s) && o.count > s.count);
    TraceReader a(o.path), b(s.path);
    TraceRecord x, y;
    bool hx = a.next(x), hy = b.next(y), different = false, incomplete = false, comparedBefore = false, comparedAfter = false;
    auto compareRecord = [&]() {
        if (x.phase == "BEFORE") comparedBefore = true;
        if (x.phase == "INSIDE") c.compared += std::min(x.last, y.last) - std::max(x.iteration, y.iteration) + 1;
        if (x.phase == "AFTER") {
            if (!exited(o) || !exited(s)) return;
            comparedAfter = true;
        }
        if (x.values.size() != y.values.size()) incomplete = true;
        for (auto &[name, val] : x.values) {
            auto it = y.values.find(name);
            if (it == y.values.end()) {
                incomplete = true;
                continue;
            }
            auto v = compareValue(val, it->second);
            incomplete |= v.incomplete;
            different |= v.different;
        }
    };
    auto rank = [](const TraceRecord &r) { return r.phase == "BEFORE" ? 0 : r.phase == "INSIDE" ? 1
                                                                                                : 2; };
    while (hx && hy) {
        auto rx = rank(x), ry = rank(y);
        if (rx == ry && (rx != 1 || (x.iteration <= y.last && y.iteration <= x.last))) {
            compareRecord();
            if (rx != 1 || x.last == y.last) {
                hx = a.next(x);
                hy = b.next(y);
            } else if (x.last < y.last) {
                y.iteration = x.last + 1;
                hx = a.next(x);
            } else {
                x.iteration = y.last + 1;
                hy = b.next(y);
            }
        } else if (rx < ry || (rx == ry && x.last < y.iteration)) {
            hx = a.next(x);
        } else {
            hy = b.next(y);
        }
    }
    while (hx) hx = a.next(x);
    while (hy) hy = b.next(y);
    if (a.invalid || b.invalid) {
        c.result = "ERROR";
        return c;
    }
    auto common = std::min(o.count, s.count);
    auto completedCommon = timedOut(o) && timedOut(s) ? std::min(o.recorded, s.recorded) : common;
    if (!comparedBefore || c.compared != completedCommon || (exited(o) && exited(s) && !comparedAfter)) incomplete = true;
    if ((o.capped && o.recorded < common) || (s.capped && s.recorded < common)) incomplete = true;
    if (different || countDiff)
        c.result = "MISMATCH";
    else if (incomplete)
        c.result = "INCONCLUSIVE";
    else if (exited(o) && exited(s))
        c.result = "MATCH";
    else if (timedOut(o) && timedOut(s) && c.compared > 0)
        c.result = "PREFIX_MATCH";
    else
        c.result = "INCONCLUSIVE";
    return c;
}

static constexpr size_t cellLimit = 30000;

static std::string clip(std::string s, size_t n) {
    if (s.size() <= n) return s;
    if (n < 4) return "";
    n -= 3;
    while (n > 0 && (static_cast<unsigned char>(s[n]) & 0xc0) == 0x80) --n;
    return s.substr(0, n) + "...";
}

struct Report {
    xlnt::workbook book;
    std::filesystem::path path;
    std::map<std::tuple<std::string, std::string, std::string>, unsigned> rows;

    explicit Report(std::filesystem::path p)
        : path(std::move(p)) {
        bool existing = false;
        if (std::filesystem::exists(path)) {
            xlnt::workbook prior;
            prior.load(path.string());
            auto sheet = prior.active_sheet();
            existing = sheet.cell("G1").to_string() == "Test Case" &&
                       sheet.cell("M1").to_string() == "Comparison" &&
                       sheet.cell("N1").to_string() == "Original Iterations" &&
                       sheet.cell("Q1").to_string() == "Program Directory" &&
                       sheet.cell("S1").to_string() == "Loop Mapping";
            if (existing)
                book.load(path.string());
            else {
                auto backup = path.parent_path() / "results_SlicingValidation_legacy.xlsx";
                for (unsigned n = 1; std::filesystem::exists(backup); ++n)
                    backup = path.parent_path() / ("results_SlicingValidation_legacy_" + std::to_string(n) + ".xlsx");
                std::filesystem::copy_file(path, backup);
                std::cout << "Previous report preserved: " << backup << '\n';
            }
        }
        auto sh = book.active_sheet();
        if (!existing) {
            sh.title("Test Case States");
            const std::vector<std::string> headers = {"Original Program", "Sliced Variant", "Loop ID (slicer line)", "Function", "Loop Type", "Condition Variables", "Test Case", "Test Inputs", "Original Program States", "Sliced Program States", "Original Status", "Slice Status", "Comparison", "Original Iterations", "Slice Iterations", "Compared Iterations", "Program Directory", "Raw Trace Directory", "Loop Mapping"};
            const std::vector<double> widths = {38, 42, 20, 22, 16, 32, 14, 48, 75, 75, 32, 32, 29, 20, 20, 20, 48, 48, 40};
            for (size_t i = 0; i < headers.size(); ++i) {
                auto cell = sh.cell(std::string(1, char('A' + i)) + "1");
                cell.value(headers[i]);
                cell.font(xlnt::font().bold(true));
                xlnt::column_properties props;
                props.width = widths[i];
                props.custom_width = true;
                sh.add_column_properties(static_cast<xlnt::column_t>(i + 1), props);
            }
            sh.freeze_panes("A2");
            save();
        } else {
            for (unsigned r = 2; r <= static_cast<unsigned>(sh.highest_row()); ++r) {
                auto n = std::to_string(r);
                rows[{sh.cell("Q" + n).to_string(), sh.cell("B" + n).to_string(), sh.cell("G" + n).to_string()}] = r;
            }
        }
    }

    void save() {
        auto tmp = path.parent_path() / ".results_SlicingValidation.tmp.xlsx";
        book.save(tmp.string());
        std::filesystem::rename(tmp, path);
    }

    void record(const std::vector<std::string> &data) {
        auto sh = book.active_sheet();
        auto key = std::make_tuple(data[16], data[1], data[6]);
        auto it = rows.find(key);
        auto row = it == rows.end() ? static_cast<unsigned>(sh.highest_row()) + 1 : it->second;
        rows[key] = row;
        xlnt::alignment alignment;
        alignment.vertical(xlnt::vertical_alignment::top);
        alignment.wrap(true);
        for (size_t i = 0; i < data.size(); ++i) {
            auto cell = sh.cell(std::string(1, char('A' + i)) + std::to_string(row));
            if ((i == 13 || i == 14 || i == 15) && !data[i].empty() && std::all_of(data[i].begin(), data[i].end(), [](unsigned char c) { return std::isdigit(c); }))
                cell.value(static_cast<double>(std::stoull(data[i])));
            else
                cell.value(clip(data[i], cellLimit));
            cell.alignment(alignment);
        }
        xlnt::row_properties props;
        props.height = 220.0;
        props.custom_height = true;
        sh.add_row_properties(row, props);
        save();
    }
};

static std::filesystem::path sliceDir(const std::filesystem::path &p) {
    for (auto d : {p / "analyzer_artifacts" / "sliced_variants", p / "sliced_variants"})
        if (std::filesystem::is_directory(d)) return d;
    return {};
}

static std::filesystem::path originalFile(const std::filesystem::path &p) {
    auto expected = p / (p.filename().string() + ".c");
    if (std::filesystem::is_regular_file(expected)) return expected;
    std::vector<std::filesystem::path> c;
    for (auto &e : std::filesystem::directory_iterator(p))
        if (e.is_regular_file() && e.path().extension() == ".c") c.push_back(e.path());
    if (c.size() != 1) throw std::runtime_error("Expected exactly one original C file in " + p.string());
    return c[0];
}

static std::vector<std::filesystem::path> discover(const std::filesystem::path &p) {
    if (!std::filesystem::is_directory(p)) throw std::runtime_error("Input must be a directory");
    if (!sliceDir(p).empty() && std::filesystem::is_regular_file(p / "test_cases.csv")) return {p};
    std::vector<std::filesystem::path> out;
    for (auto &e : std::filesystem::recursive_directory_iterator(p, std::filesystem::directory_options::skip_permission_denied))
        if (e.is_regular_file() && e.path().filename() == "test_cases.csv" && !sliceDir(e.path().parent_path()).empty()) out.push_back(e.path().parent_path());
    std::sort(out.begin(), out.end());
    out.erase(std::unique(out.begin(), out.end()), out.end());
    return out;
}

static void program(const std::filesystem::path &p, const std::filesystem::path &runDir, Report &report) {
    bool hasTargetC = false;
    const std::regex targetName(R"(_Loop[1-9][0-9]*\.c$)");
    for (auto &e : std::filesystem::directory_iterator(sliceDir(p)))
        if (e.is_regular_file() && std::regex_search(e.path().filename().string(), targetName)) hasTargetC = true;
    if (!hasTargetC) {
        std::cout << "No targeted C loop variants: " << p << '\n';
        return;
    }
    auto originalPath = originalFile(p);
    auto raw = read(originalPath);
    const std::string header = "#include \"stdlib.h\"\n";
    if (raw.find(header) == std::string::npos) raw = header + raw;
    std::vector<std::filesystem::path> variants;
    for (auto &e : std::filesystem::directory_iterator(sliceDir(p)))
        if (e.is_regular_file() && e.path().extension() == ".c") variants.push_back(e.path());
    std::sort(variants.begin(), variants.end());
    std::regex pattern(R"(_Loop([0-9]+)\.c$)");
    for (auto &slice : variants) {
        std::smatch m;
        auto name = slice.filename().string();
        if (!std::regex_search(name, m, pattern) || name.substr(0, m.position()) != originalPath.stem().string()) {
            std::cerr << "Skipping non-matching variant: " << slice << '\n';
            continue;
        }
        unsigned line = std::stoul(m[1]);
        if (!line) {
            std::cout << "Skipping Loop0 (no target loop): " << slice << '\n';
            continue;
        }
        auto dir = runDir / slice.stem();
        std::filesystem::create_directories(dir);
        std::vector<std::string> base(19);
        base[0] = originalPath.filename().string();
        base[1] = name;
        base[2] = std::to_string(line);
        base[16] = p.string();
        base[17] = dir.string();
        std::vector<Test> testCases;
        auto errorRow = [&](const Test *t, const std::string &error) {
            auto row = base;
            row[6] = t ? std::to_string(t->id) : "N/A";
            if (t) row[7] = t->description;
            row[10] = row[11] = "NOT_EXECUTED";
            row[12] = "ERROR";
            std::cerr << error << '\n';
            report.record(row);
        };
        try {
            testCases = tests(p / "test_cases.csv");
        } catch (const std::exception &e) {
            errorRow(nullptr, e.what());
            continue;
        }
        std::optional<Analysis> original;
        std::optional<size_t> oi;
        try {
            original = inspect(raw, originalPath);
            oi = locate(*original, line);
            if (!oi) throw std::runtime_error("ORIGINAL_LOOP_NOT_FOUND_AT_SLICER_LINE");
            auto &loop = original->loops[*oi];
            auto &vars = original->criteria[*oi].conditionVariables;
            base[3] = loop.fn->getNameAsString();
            base[4] = loop.kind;
            base[5] = vars.empty() ? "(none)" : join(vars, ", ");
        } catch (const std::exception &e) {
            base[18] = e.what();
            for (auto &t : testCases) errorRow(&t, e.what());
            continue;
        }
        auto &vars = original->criteria[*oi].conditionVariables;
        std::optional<Analysis> variant;
        std::optional<size_t> si;
        std::string sliceSource, sliceError;
        try {
            sliceSource = read(slice);
            variant = inspect(sliceSource, slice);
            si = mapLoop(*original, *oi, *variant);
            base[18] = "Heuristic AST mapping: " + variant->loops[*si].fn->getNameAsString() + " | slice line " + std::to_string(variant->loops[*si].line);
        } catch (const std::exception &e) {
            si.reset();
            sliceError = e.what();
            base[18] = sliceError;
        }
        for (auto &t : testCases) {
            std::cout << originalPath.filename().string() << " | " << name << " | Test Case " << t.id << std::endl;
            auto row = base;
            row[6] = std::to_string(t.id);
            row[7] = t.description;
            auto testDir = dir / ("TestCase" + std::to_string(t.id));
            row[17] = testDir.string();
            try {
                std::filesystem::create_directories(testDir);
                write(testDir / "input.txt", t.description + "\n");
                std::cout << "  Running original (60s limit)..." << std::endl;
                auto o = runOne(raw, originalPath, *original, *original, *oi, vars, t, testDir / "original", false);
                std::cout << "  Original: " << o.status << " | iterations: " << o.count << std::endl;
                Outcome s;
                std::cout << "  Running slice (60s limit)..." << std::endl;
                if (si)
                    s = runOne(sliceSource, slice, *original, *variant, *si, vars, t, testDir / "slice", true);
                else {
                    auto d = testDir / "slice";
                    std::filesystem::create_directories(d);
                    auto path = d / "states.txt";
                    write(path, "");
                    s = {sliceError, "Status: " + sliceError + "\n", path.string()};
                }
                std::cout << "  Slice: " << s.status << " | iterations: " << s.count << std::endl;
                std::cout << "  Comparing states..." << std::endl;
                write(testDir / "original" / "status.txt", o.status + "\n");
                write(testDir / "slice" / "status.txt", s.status + "\n");
                row[8] = "Full trace: " + o.path + "\n" + clip(o.preview, cellLimit - std::min(cellLimit, o.path.size() + 20));
                row[9] = "Full trace: " + s.path + "\n" + clip(s.preview, cellLimit - std::min(cellLimit, s.path.size() + 20));
                row[10] = o.status;
                row[11] = s.status;
                auto c = compareOutcomes(o, s);
                row[12] = c.result;
                std::cout << "  Comparison: " << c.result << std::endl;
                row[13] = std::to_string(o.count);
                row[14] = std::to_string(s.count);
                row[15] = std::to_string(c.compared);
                write(testDir / "comparison.txt", c.result + "\n");
            } catch (const std::exception &e) {
                row[12] = "ERROR";
                std::cerr << e.what() << '\n';
            }
            report.record(row);
        }
    }
}

int validateSlicedPrograms(const std::filesystem::path &input, const std::filesystem::path &root) {
    auto dirs = discover(input);
    if (dirs.empty()) throw std::runtime_error("No folders containing test_cases.csv and sliced_variants were found");
    auto traceRoot = root / "results_SlicingValidation";
    std::filesystem::create_directories(traceRoot);
    auto runName = (traceRoot / "run_XXXXXX").string();
    std::vector<char> templateName(runName.begin(), runName.end());
    templateName.push_back('\0');
    char *made = mkdtemp(templateName.data());
    if (!made) throw std::runtime_error("Cannot create trace directory");
    std::filesystem::path runDir = made;
    Report report(root / "results_SlicingValidation.xlsx");
    size_t index = 0;
    bool failed = false;
    for (auto &p : dirs) {
        try {
            program(p, runDir / (std::to_string(++index) + "_" + p.filename().string()), report);
        } catch (const std::exception &e) {
            failed = true;
            std::cerr << p << ": " << e.what() << '\n';
        }
    }
    if (!std::filesystem::exists(report.path)) report.book.save(report.path.string());
    std::cout << "Workbook: " << report.path << "\nFull traces: " << runDir << '\n';
    return failed ? 1 : 0;
}