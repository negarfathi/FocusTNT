#ifndef CONCRETIZER_VISITOR_AND_REWRITER_H
#define CONCRETIZER_VISITOR_AND_REWRITER_H

#include <clang/Lex/Lexer.h>
#include "clang/Basic/SourceManager.h"
#include "clang/Rewrite/Core/Rewriter.h"
#include "clang/AST/RecursiveASTVisitor.h"

#include "../file/info.h"
#include "variable_assignment.h"

namespace concretizer {

    class VisitorAndRewriter : public clang::RecursiveASTVisitor<VisitorAndRewriter> {
        struct ArrDecl {
            std::string name;
            std::string type;
            bool isConstantSize;
            std::string sizeExpr;
            clang::SourceRange declRange;
        };
        std::map<std::string, ArrDecl> arrDecls;
        std::string currentFuncName;

    public:
        explicit VisitorAndRewriter(clang::ASTContext *Context, clang::Rewriter &Rewriter, std::vector<VariableAssignment> &assignments, std::string &assignmentIndex) : Context(Context), Rewriter(Rewriter), assignments(assignments), assignmentIndex(assignmentIndex) {}

        bool VisitFunctionDecl(clang::FunctionDecl *FD);
        bool VisitVarDecl(clang::VarDecl *VD);
        bool VisitBinaryOperator(clang::BinaryOperator *BO);
        bool VisitIfStmt(clang::IfStmt *IS);
        bool VisitReturnStmt(clang::ReturnStmt *RS);

        void ProcessIfCondition(clang::Expr *condExpr);

    private:
        clang::ASTContext *Context;
        clang::Rewriter &Rewriter;
        std::string &assignmentIndex;
        std::vector<VariableAssignment> &assignments;
    };

}

#endif //CONCRETIZER_VISITOR_AND_REWRITER_H