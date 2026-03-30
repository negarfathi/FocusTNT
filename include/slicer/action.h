#ifndef SLICER_ACTION_H
#define SLICER_ACTION_H

#include "clang/Frontend/FrontendAction.h"

#include "consumer.h"

using namespace clang;

namespace slicer {

    class Action : public clang::ASTFrontendAction {
    public:
        explicit Action(std::vector<LoopDescriptor> &loops) : loops(loops) {}

        virtual std::unique_ptr<clang::ASTConsumer> CreateASTConsumer(clang::CompilerInstance &Compiler, llvm::StringRef InFile);

    private:
        clang::Rewriter Rewriter;
        std::vector<LoopDescriptor> &loops;
    };

}

#endif //SLICER_ACTION_H