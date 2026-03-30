#include "../../include/slicer/action.h"

std::unique_ptr<clang::ASTConsumer> slicer::Action::CreateASTConsumer(clang::CompilerInstance &Compiler, llvm::StringRef InFile) {
    Rewriter.setSourceMgr(Compiler.getSourceManager(), Compiler.getLangOpts());
    return std::make_unique<Consumer>(&Compiler.getASTContext(), Rewriter, loops);
}