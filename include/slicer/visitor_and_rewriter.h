#ifndef SLICER_VISITOR_AND_REWRITER_H
#define SLICER_VISITOR_AND_REWRITER_H

#include "clang/AST/Decl.h"
#include <clang/Lex/Lexer.h>
#include "clang/Basic/SourceManager.h"
#include "clang/AST/ParentMapContext.h"
#include "clang/Rewrite/Core/Rewriter.h"
#include "clang/AST/RecursiveASTVisitor.h"

#include "../file/info.h"
#include "loop_descriptor.h"

namespace slicer {

    class VisitorAndRewriter : public clang::RecursiveASTVisitor<VisitorAndRewriter> {
        int tmpVarCounter = 0;
        std::string currentFuncName;
        clang::SourceLocation preLoopLoc;

    public:
        explicit VisitorAndRewriter(clang::ASTContext *Context, clang::Rewriter &Rewriter, std::vector<LoopDescriptor> &loops) : Context(Context), Rewriter(Rewriter), loops(loops) {}

        bool VisitFunctionDecl(clang::FunctionDecl *FD);
        bool VisitForStmt(clang::ForStmt *FS);
        bool VisitWhileStmt(clang::WhileStmt *WS);
        bool VisitDoStmt(clang::DoStmt *DS);

        void CollectConditionVariables(clang::Expr *expr, LoopDescriptor &loop);
        void AnnotateEarlyExits(clang::Stmt *stmt, LoopDescriptor &loop);

    private:
        clang::ASTContext *Context;
        clang::Rewriter &Rewriter;
        std::vector<LoopDescriptor> &loops;
    };

}

#endif //SLICER_VISITOR_AND_REWRITER_H