#ifndef NONDET_EXTRACTOR_ACTION_H
#define NONDET_EXTRACTOR_ACTION_H

#include "clang/Frontend/FrontendAction.h"

#include "consumer.h"

using namespace clang;

namespace nondet_extractor {

    class Action : public clang::ASTFrontendAction {
    public:
        explicit Action(std::vector<NondetInput> &inputs) : inputs(inputs) {}

        virtual std::unique_ptr<clang::ASTConsumer> CreateASTConsumer(clang::CompilerInstance &Compiler, llvm::StringRef InFile);

    private:
        std::vector<NondetInput> &inputs;
    };

}

#endif // NONDET_EXTRACTOR_ACTION_H