#include "../../include/slicer/visitor_and_rewriter.h"

bool slicer::VisitorAndRewriter::VisitFunctionDecl(clang::FunctionDecl *FD) {
    clang::SourceManager &SM = Rewriter.getSourceMgr();
    if (SM.isInMainFile(FD->getBeginLoc())) {
        currentFuncName = FD->getNameAsString();
    }
    return true;
}

bool slicer::VisitorAndRewriter::VisitForStmt(clang::ForStmt *FS) {
    clang::SourceManager &SM = Rewriter.getSourceMgr();
    if (SM.isInMainFile(FS->getForLoc())) {
        preLoopLoc = SM.getSpellingLoc(FS->getForLoc());
        LoopDescriptor loop;
        loop.functionName = currentFuncName;
        loop.lineNumber = std::to_string(SM.getSpellingLineNumber(FS->getForLoc()));
        if (clang::Expr *cond = FS->getCond()) {
            CollectConditionVariables(cond, loop);
        }
        if (clang::Stmt *body = FS->getBody()) {
            AnnotateEarlyExits(body, loop);
        }
        loops.push_back(loop);
    }
    return true;
}

bool slicer::VisitorAndRewriter::VisitWhileStmt(clang::WhileStmt *WS) {
    clang::SourceManager &SM = Rewriter.getSourceMgr();
    if (SM.isInMainFile(WS->getWhileLoc())) {
        preLoopLoc = SM.getSpellingLoc(WS->getWhileLoc());
        LoopDescriptor loop;
        loop.functionName = currentFuncName;
        loop.lineNumber = std::to_string(SM.getSpellingLineNumber(WS->getWhileLoc()));
        if (clang::Expr *cond = WS->getCond()) {
            CollectConditionVariables(cond, loop);
        }
        if (clang::Stmt *body = WS->getBody()) {
            AnnotateEarlyExits(body, loop);
        }
        loops.push_back(loop);
    }
    return true;
}

bool slicer::VisitorAndRewriter::VisitDoStmt(clang::DoStmt *DS) {
    clang::SourceManager &SM = Rewriter.getSourceMgr();
    if (SM.isInMainFile(DS->getDoLoc())) {
        preLoopLoc = SM.getSpellingLoc(DS->getDoLoc());
        LoopDescriptor loop;
        loop.functionName = currentFuncName;
        loop.lineNumber = std::to_string(SM.getSpellingLineNumber(DS->getDoLoc()));
        if (clang::Expr *cond = DS->getCond()) {
            CollectConditionVariables(cond, loop);
        }
        if (clang::Stmt *body = DS->getBody()) {
            AnnotateEarlyExits(body, loop);
        }
        loops.push_back(loop);
    }
    return true;
}

void slicer::VisitorAndRewriter::CollectConditionVariables(clang::Expr *expr, LoopDescriptor &loop) {
    if (!expr) return;

    expr = expr->IgnoreParenImpCasts();

    if (auto *DRE = llvm::dyn_cast<clang::DeclRefExpr>(expr)) {
        if (auto *VD = llvm::dyn_cast<clang::VarDecl>(DRE->getDecl())) {
            std::string varName = VD->getNameAsString();
            if (std::find(loop.conditionVariables.begin(), loop.conditionVariables.end(), varName) == loop.conditionVariables.end()) {
                loop.conditionVariables.push_back(varName);
            }
        }
    }

    else if (auto *ASE = llvm::dyn_cast<clang::ArraySubscriptExpr>(expr)) {
        CollectConditionVariables(ASE->getBase(), loop);
    }

    else if (auto *ME = llvm::dyn_cast<clang::MemberExpr>(expr)) {
        std::string varName = clang::Lexer::getSourceText(clang::CharSourceRange::getTokenRange(ME->getBeginLoc(), ME->getEndLoc()), Rewriter.getSourceMgr(), Rewriter.getLangOpts()).str();
        if (std::find(loop.conditionVariables.begin(), loop.conditionVariables.end(), varName) == loop.conditionVariables.end()) {
            loop.conditionVariables.push_back(varName);
        }
    }

    else if (auto *Call = llvm::dyn_cast<clang::CallExpr>(expr)) {
        std::string varName = "tmpVar" + std::to_string(tmpVarCounter);
        auto callRange = clang::CharSourceRange::getTokenRange(Call->getBeginLoc(), Call->getEndLoc());
        std::string callStr = clang::Lexer::getSourceText(callRange, Rewriter.getSourceMgr(), Rewriter.getLangOpts()).str();
        Rewriter.ReplaceText(callRange, "(" + varName + " = " + callStr + ")");
        Rewriter.InsertText(preLoopLoc, Call->getType().getAsString() + " " + varName + ";\n", true, true);
        if (std::find(loop.conditionVariables.begin(), loop.conditionVariables.end(), varName) == loop.conditionVariables.end()) {
            loop.conditionVariables.push_back(varName);
        }
        tmpVarCounter = tmpVarCounter + 1;
    }

    else if (auto *UO = llvm::dyn_cast<clang::UnaryOperator>(expr)) {
        CollectConditionVariables(UO->getSubExpr(), loop);
    }

    else if (auto *BO = llvm::dyn_cast<clang::BinaryOperator>(expr)) {
        CollectConditionVariables(BO->getLHS(), loop);
        CollectConditionVariables(BO->getRHS(), loop);
    }
}

void slicer::VisitorAndRewriter::AnnotateEarlyExits(clang::Stmt *stmt, LoopDescriptor &loop) {
    if (!stmt) return;

    clang::SourceManager &SM = Rewriter.getSourceMgr();

    if (auto *BR = llvm::dyn_cast<clang::BreakStmt>(stmt)) {
        clang::SourceLocation location = BR->getBeginLoc();
        if (location.isValid() && SM.isWrittenInMainFile(location)) {
            loop.hasEarlyExits = true;
            Rewriter.InsertText(location, "/*@ \\slicing::slice_preserve_ctrl; */\n", true, true);
        }
    }

    else if (auto *GS = llvm::dyn_cast<clang::GotoStmt>(stmt)) {
        clang::SourceLocation location = GS->getBeginLoc();
        if (location.isValid() && SM.isWrittenInMainFile(location)) {
            loop.hasEarlyExits = true;
            Rewriter.InsertText(location, "/*@ \\slicing::slice_preserve_ctrl; */\n", true, true);
        }
    }

    else if (auto *RS = llvm::dyn_cast<clang::ReturnStmt>(stmt)) {
        clang::SourceLocation location = RS->getBeginLoc();
        if (location.isValid() && SM.isWrittenInMainFile(location)) {
            loop.hasEarlyExits = true;
            Rewriter.InsertText(location, "/*@ \\slicing::slice_preserve_ctrl; */\n", true, true);
        }
    }

    for (clang::Stmt *child : stmt->children()) {
        if (child) {
            AnnotateEarlyExits(child, loop);
        }
    }
}