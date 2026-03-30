#ifndef CONCRETIZER_CONSUMER_H
#define CONCRETIZER_CONSUMER_H

#include "clang/Frontend/CompilerInstance.h"

#include "visitor_and_rewriter.h"

using namespace clang;

namespace concretizer {

    class Consumer : public clang::ASTConsumer {
    public:
        explicit Consumer(ASTContext *Context, Rewriter &Rewriter, std::vector<VariableAssignment> &assignments, std::string &assignmentIndex) : Visitor(Context, Rewriter, assignments, assignmentIndex), Rewriter(Rewriter), assignmentIndex(assignmentIndex) {}

        virtual void HandleTranslationUnit(clang::ASTContext &Context);

    private:
        VisitorAndRewriter Visitor;
        clang::Rewriter &Rewriter;
        std::string &assignmentIndex;
    };

}

#endif //CONCRETIZER_CONSUMER_H