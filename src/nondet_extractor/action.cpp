#include "../../include/nondet_extractor/action.h"

std::unique_ptr<clang::ASTConsumer> nondet_extractor::Action::CreateASTConsumer(clang::CompilerInstance &Compiler, llvm::StringRef InFile) {
    return std::make_unique<Consumer>(&Compiler.getASTContext(), inputs);
}
