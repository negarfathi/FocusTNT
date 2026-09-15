#include "../../include/nondet_extractor/consumer.h"

void nondet_extractor::Consumer::HandleTranslationUnit(clang::ASTContext &Context) {
    Visitor.TraverseDecl(Context.getTranslationUnitDecl());
}
