#include "../../include/concretizer/consumer.h"

void concretizer::Consumer::HandleTranslationUnit(clang::ASTContext &Context) {
    Visitor.TraverseDecl(Context.getTranslationUnitDecl());
    std::error_code EC;
    llvm::raw_fd_ostream stream((sourceCodeDirectory / (sourceCodeName + "_TestCase" + assignmentIndex + sourceCodeExtension)).string(), EC, llvm::sys::fs::OF_Text);
    Rewriter.getEditBuffer(Rewriter.getSourceMgr().getMainFileID()).write(stream);
    stream.close();
}