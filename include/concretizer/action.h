#ifndef CONCRETIZER_ACTION_H
#define CONCRETIZER_ACTION_H

#include "clang/Frontend/FrontendAction.h"

#include "consumer.h"

using namespace clang;

namespace concretizer {

    class Action : public clang::ASTFrontendAction {
    public:
        explicit Action(std::vector<VariableAssignment> &assignments, std::string &assignmentIndex) : assignments(assignments), assignmentIndex(assignmentIndex) {}

        virtual std::unique_ptr<clang::ASTConsumer> CreateASTConsumer(clang::CompilerInstance &Compiler, llvm::StringRef InFile);

    private:
        clang::Rewriter Rewriter;
        std::string &assignmentIndex;
        std::vector<VariableAssignment> &assignments;
    };

}

#endif //CONCRETIZERT_ACTION_H