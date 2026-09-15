#ifndef NONDET_EXTRACTOR_VISITOR_AND_REWRITER_H
#define NONDET_EXTRACTOR_VISITOR_AND_REWRITER_H

#include <unordered_map>
#include <unordered_set>

#include <clang/Lex/Lexer.h>
#include "clang/Basic/SourceManager.h"
#include "clang/Rewrite/Core/Rewriter.h"
#include "clang/AST/RecursiveASTVisitor.h"

#include "nondet_input.h"

namespace nondet_extractor {

    class VisitorAndRewriter : public clang::RecursiveASTVisitor<VisitorAndRewriter> {
        std::string currentFunctionName;

        std::map<std::string, unsigned> nondetOccurrenceCounts;
        std::unordered_set<const clang::CallExpr *> processedNondetCalls;

        struct ArrayDeclaration {
            std::string name;
            std::string elementType;
            bool isConstantSize = false;
            std::string sizeExpression;
        };
        std::map<std::string, ArrayDeclaration> arrayDeclarations;

    public:
        explicit VisitorAndRewriter(clang::ASTContext *Context, std::vector<NondetInput> &inputs) : Context(Context), inputs(inputs) {}

        bool VisitFunctionDecl(clang::FunctionDecl *FD);
        bool VisitVarDecl(clang::VarDecl *VD);
        bool VisitBinaryOperator(clang::BinaryOperator *BO);
        bool VisitIfStmt(clang::IfStmt *IS);
        bool VisitReturnStmt(clang::ReturnStmt *RS);

        bool IsNondetCall(const clang::CallExpr *callExpr);
        std::string GenerateNondetID(const std::string &variableName);
        void ProcessIfCondition(clang::Expr *condExpr);

    private:
        clang::ASTContext *Context;
        std::vector<NondetInput> &inputs;
    };

}

#endif // NONDET_EXTRACTOR_VISITOR_AND_REWRITER_H