#ifndef SLICER_CONSUMER_H
#define SLICER_CONSUMER_H

#include "clang/Frontend/CompilerInstance.h"

#include "visitor_and_rewriter.h"

using namespace clang;

namespace slicer {

    class Consumer : public clang::ASTConsumer {
    public:
        explicit Consumer(ASTContext *Context, Rewriter &Rewriter, std::vector<LoopDescriptor> &loops) : Visitor(Context, Rewriter, loops), Rewriter(Rewriter) {}

        virtual void HandleTranslationUnit(clang::ASTContext &Context);

    private:
        VisitorAndRewriter Visitor;
        clang::Rewriter &Rewriter;
    };

}

#endif //SLICER_CONSUMER_H