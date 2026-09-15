#ifndef NONDET_EXTRACTOR_CONSUMER_H
#define NONDET_EXTRACTOR_CONSUMER_H

#include "clang/Frontend/CompilerInstance.h"

#include "visitor_and_rewriter.h"

using namespace clang;

namespace nondet_extractor {

    class Consumer : public clang::ASTConsumer {
    public:
        explicit Consumer(clang::ASTContext *Context, std::vector<NondetInput> &inputs) : Visitor(Context, inputs) {}

        virtual void HandleTranslationUnit(clang::ASTContext &Context);

    private:
        VisitorAndRewriter Visitor;
    };

}

#endif // NONDET_EXTRACTOR_CONSUMER_H