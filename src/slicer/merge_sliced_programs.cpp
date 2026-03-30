#include <filesystem>

#include <clang/Tooling/Tooling.h>
#include <clang/Rewrite/Core/Rewriter.h>
#include <clang/AST/RecursiveASTVisitor.h>

namespace FunctionBodyExtractor {

    class Visitor : public clang::RecursiveASTVisitor<Visitor> {
    public:
        explicit Visitor(clang::ASTContext *Context, clang::Rewriter &Rewriter, std::string &functionName, std::string &extractedFunctionBody) : Context(Context), Rewriter(Rewriter), functionName(functionName), extractedFunctionBody(extractedFunctionBody) {}

        bool VisitFunctionDecl(clang::FunctionDecl *FD) {
            if (!FD->isThisDeclarationADefinition())
                return true;
            std::string name = FD->getNameAsString();
            if (name.find(functionName) != std::string::npos && FD->hasBody()) {
                clang::Stmt *Body = FD->getBody();
                clang::SourceManager &SM = Context->getSourceManager();
                clang::LangOptions LO;
                LO.CPlusPlus = true;
                clang::CharSourceRange range = clang::CharSourceRange::getTokenRange(Body->getSourceRange());
                extractedFunctionBody = clang::Lexer::getSourceText(range, SM, LO).str();
            }
            return true;
        }

    private:
        clang::ASTContext *Context;
        clang::Rewriter &Rewriter;
        std::string &functionName;
        std::string &extractedFunctionBody;
    };

    class Consumer : public clang::ASTConsumer {
    public:
        explicit Consumer(clang::ASTContext *Context, clang::Rewriter &Rewriter, std::string &functionName, std::string &extractedFunctionBody) : Visitor(Context, Rewriter, functionName, extractedFunctionBody), Rewriter(Rewriter) {}

        void HandleTranslationUnit(clang::ASTContext &Context) override {
            Visitor.TraverseDecl(Context.getTranslationUnitDecl());
        }

    private:
        Visitor Visitor;
        clang::Rewriter &Rewriter;
    };

    class Action : public clang::ASTFrontendAction {
    public:
        explicit Action(std::string &functionName, std::string &extractedFunctionBody) : functionName(functionName), extractedFunctionBody(extractedFunctionBody) {}

        std::unique_ptr<clang::ASTConsumer> CreateASTConsumer(clang::CompilerInstance &Compiler, clang::StringRef InFile) override {
            Rewriter.setSourceMgr(Compiler.getSourceManager(), Compiler.getLangOpts());
            return std::make_unique<Consumer>(&Compiler.getASTContext(), Rewriter, functionName, extractedFunctionBody);
        }

    private:
        clang::Rewriter Rewriter;
        std::string &functionName;
        std::string &extractedFunctionBody;
    };

}

namespace FunctionBodyReplacer {

    class Visitor : public clang::RecursiveASTVisitor<Visitor> {
    public:
        explicit Visitor(clang::ASTContext *Context, clang::Rewriter &Rewriter, std::string &functionName, std::string &extractedFunctionBody) : Context(Context), Rewriter(Rewriter), functionName(functionName), extractedFunctionBody(extractedFunctionBody) {}

        bool VisitFunctionDecl(clang::FunctionDecl *FD) {
            if (!FD->isThisDeclarationADefinition())
                return true;
            std::string name = FD->getNameAsString();
            if (name.find(functionName) != std::string::npos && FD->hasBody()) {
                const clang::Stmt *OldBody = FD->getBody();
                clang::CharSourceRange range = clang::CharSourceRange::getTokenRange(OldBody->getSourceRange());
                Rewriter.ReplaceText(range, extractedFunctionBody);
            }
            return true;
        }

    private:
        clang::ASTContext *Context;
        clang::Rewriter &Rewriter;
        std::string &functionName;
        std::string &extractedFunctionBody;
    };

    class Consumer : public clang::ASTConsumer {
    public:
        explicit Consumer(clang::ASTContext *Context, clang::Rewriter &Rewriter, std::string &functionName, std::string &extractedFunctionBody, std::filesystem::path &mergedSlicedProgram) : Visitor(Context, Rewriter, functionName, extractedFunctionBody), Rewriter(Rewriter), mergedSlicedProgram(mergedSlicedProgram) {}

        void HandleTranslationUnit(clang::ASTContext &Context) override {
            Visitor.TraverseDecl(Context.getTranslationUnitDecl());
            std::error_code EC;
            llvm::raw_fd_ostream stream(mergedSlicedProgram.string(), EC, llvm::sys::fs::OF_Text);
            Rewriter.getEditBuffer(Rewriter.getSourceMgr().getMainFileID()).write(stream);
            stream.close();
        }

    private:
        Visitor Visitor;
        clang::Rewriter &Rewriter;
        std::filesystem::path &mergedSlicedProgram;
    };

    class Action : public clang::ASTFrontendAction {
    public:
        explicit Action(std::string &functionName, std::string &extractedFunctionBody, std::filesystem::path &mergedSlicedProgram) : functionName(functionName), extractedFunctionBody(extractedFunctionBody), mergedSlicedProgram(mergedSlicedProgram) {}

        std::unique_ptr<clang::ASTConsumer> CreateASTConsumer(clang::CompilerInstance &Compiler, clang::StringRef InFile) override {
            Rewriter.setSourceMgr(Compiler.getSourceManager(), Compiler.getLangOpts());
            return std::make_unique<Consumer>(&Compiler.getASTContext(), Rewriter, functionName, extractedFunctionBody, mergedSlicedProgram);
        }

    private:
        clang::Rewriter Rewriter;
        std::string &functionName;
        std::string &extractedFunctionBody;
        std::filesystem::path &mergedSlicedProgram;
    };

}

std::string extractFunctionBody(std::string &program, std::string &functionName) {
    std::string extractedFunctionBody;
    clang::tooling::runToolOnCode(std::make_unique<FunctionBodyExtractor::Action>(functionName, extractedFunctionBody), program);
    return extractedFunctionBody;
}

void mergeSlicedPrograms(std::string &slicedProgram1, std::string &slicedProgram2, std::string &functionName, std::filesystem::path &mergedSlicedProgram) {
    std::string extractedFunctionBody = extractFunctionBody(slicedProgram1, functionName);
    clang::tooling::runToolOnCode(std::make_unique<FunctionBodyReplacer::Action>(functionName, extractedFunctionBody, mergedSlicedProgram), slicedProgram2);
}