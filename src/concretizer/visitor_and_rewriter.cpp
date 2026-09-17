#include "../../include/concretizer/visitor_and_rewriter.h"

bool concretizer::VisitorAndRewriter::IsNondetCall(const clang::CallExpr *callExpr) {
    if (callExpr == nullptr) {
        return false;
    }
    const clang::FunctionDecl *funcDecl = callExpr->getDirectCallee();
    if (funcDecl == nullptr) {
        return false;
    }
    return funcDecl->getNameAsString().starts_with("__VERIFIER_nondet_");
}

std::string concretizer::VisitorAndRewriter::GenerateNondetID(const std::string &variableName) {
    unsigned occurrence = ++nondetOccurrenceCounts[currentFunctionName + ":" + variableName];
    return currentFunctionName + ":" + variableName + ":" + std::to_string(occurrence);
}


bool concretizer::VisitorAndRewriter::VisitFunctionDecl(clang::FunctionDecl *FD) {
    clang::SourceManager &SM = Rewriter.getSourceMgr();
    if (SM.isInMainFile(FD->getBeginLoc()) && FD->doesThisDeclarationHaveABody()) {
        currentFunctionName = FD->getNameAsString();
        if (auto position = currentFunctionName.find("_slice"); position != std::string::npos) {
            currentFunctionName = currentFunctionName.substr(0, position);
        }
    }
    return true;
}

bool concretizer::VisitorAndRewriter::VisitVarDecl(clang::VarDecl *VD) {
    clang::SourceManager &SM = Rewriter.getSourceMgr();
    if (SM.isInMainFile(VD->getBeginLoc())) {
        if (VD->hasInit()) {
            clang::Expr *initExpr = VD->getInit()->IgnoreParenImpCasts();
            clang::CallExpr *initCallExpr = llvm::dyn_cast<clang::CallExpr>(initExpr);
            if (IsNondetCall(initCallExpr)) {
                std::string variableName = VD->getNameAsString();
                std::string nondetID = GenerateNondetID(variableName);
                auto iterator = std::find_if(assignments.begin(), assignments.end(), [&](const NondetAssignment &assignment) { return assignment.id == nondetID; });
                if (iterator != assignments.end()) {
                    Rewriter.ReplaceText(initCallExpr->getSourceRange(), iterator->value);
                    resolvedArraySizeValues[currentFunctionName + ":" + variableName] = iterator->value;
                    processedNondetCalls.insert(initCallExpr);
                }
            }
        }
        else {
            if (auto *AT = llvm::dyn_cast<clang::ArrayType>(VD->getType().getTypePtr())) {
                ArrayDeclaration arrayDeclaration;
                arrayDeclaration.name = VD->getNameAsString();
                arrayDeclaration.elementType = VD->getType()->getAsArrayTypeUnsafe()->getElementType().getAsString();
                if (llvm::dyn_cast<clang::ConstantArrayType>(AT)) {
                    arrayDeclaration.isConstantSize = true;
                }
                else {
                    arrayDeclaration.isConstantSize = false;
                }
                std::string arrayDeclarationStr = clang::Lexer::getSourceText(clang::CharSourceRange::getTokenRange(VD->getSourceRange()), SM, Rewriter.getLangOpts()).str();
                std::string arraySize;
                auto leftPos = arrayDeclarationStr.find('[');
                auto rightPos = arrayDeclarationStr.find(']');
                if (leftPos != std::string::npos && rightPos != std::string::npos && rightPos > leftPos) {
                    arraySize = arrayDeclarationStr.substr(leftPos + 1, rightPos - leftPos - 1);
                }
                arrayDeclaration.sizeExpression = arraySize;
                arrayDeclaration.declarationRange = VD->getSourceRange();
                arrayDeclarations[currentFunctionName + ":" + arrayDeclaration.name] = arrayDeclaration;
            }
        }
    }
    return true;
}

bool concretizer::VisitorAndRewriter::VisitBinaryOperator(clang::BinaryOperator *BO) {
    clang::SourceManager &SM = Rewriter.getSourceMgr();
    if (SM.isInMainFile(BO->getBeginLoc())) {
        if (BO->getOpcode() == clang::BO_Assign) {
            clang::Expr *rightExpr = BO->getRHS()->IgnoreParenImpCasts();
            clang::CallExpr *rightCallExpr = llvm::dyn_cast<clang::CallExpr>(rightExpr);
            if (IsNondetCall(rightCallExpr)) {
                clang::Expr *leftExpr = BO->getLHS()->IgnoreParenImpCasts();

                // Simple Variable
                if (auto *DRE = llvm::dyn_cast<clang::DeclRefExpr>(leftExpr)) {
                    if (auto *varDecl = llvm::dyn_cast<clang::VarDecl>(DRE->getDecl())) {
                        std::string variableName = varDecl->getNameAsString();
                        std::string nondetID = GenerateNondetID(variableName);
                        auto iterator = std::find_if(assignments.begin(), assignments.end(), [&](const NondetAssignment &assignment) { return assignment.id == nondetID; });
                        if (iterator != assignments.end()) {
                            Rewriter.ReplaceText(rightCallExpr->getSourceRange(), iterator->value);
                            resolvedArraySizeValues[currentFunctionName + ":" + variableName] = iterator->value;
                            processedNondetCalls.insert(rightCallExpr);
                        }
                    }
                }

                // Array Element
                else if (auto *ASE = llvm::dyn_cast<clang::ArraySubscriptExpr>(leftExpr)) {
                    if (auto *DRE = llvm::dyn_cast<clang::DeclRefExpr>(ASE->getBase()->IgnoreParenImpCasts())) {
                        if (auto *arrayDecl = llvm::dyn_cast<clang::VarDecl>(DRE->getDecl())) {
                            std::string arrayName = arrayDecl->getNameAsString();
                            std::string nondetID = GenerateNondetID(arrayName);
                            auto iterator1 = std::find_if(assignments.begin(), assignments.end(), [&](const NondetAssignment &assignment) { return assignment.id == nondetID; });
                            if (iterator1 != assignments.end()) {
                                auto iterator2 = arrayDeclarations.find(currentFunctionName + ":" + arrayName);
                                if (iterator2 != arrayDeclarations.end()) {
                                    std::string arraySize;
                                    if (iterator2->second.isConstantSize) {
                                        arraySize = iterator2->second.sizeExpression;
                                    } else {
                                        arraySize = iterator2->second.sizeExpression;
                                        auto iterator3 = resolvedArraySizeValues.find(currentFunctionName + ":" + arraySize);
                                        if (iterator3 != resolvedArraySizeValues.end()) {
                                            arraySize = iterator3->second;
                                        }
                                    }
                                    std::string arrayInitializer = iterator1->value;
                                    std::string newArrayDeclaration = iterator2->second.elementType + " " + iterator2->second.name + "[" + arraySize + "] = " + arrayInitializer;
                                    Rewriter.ReplaceText(BO->getSourceRange(), "");
                                    Rewriter.ReplaceText(iterator2->second.declarationRange, newArrayDeclaration);
                                    processedNondetCalls.insert(rightCallExpr);
                                }
                            }
                        }
                    }
                }

                // Struct Field
                else if (auto *memberExpr = llvm::dyn_cast<clang::MemberExpr>(leftExpr)) {
                    if (auto *baseExpr = memberExpr->getBase()->IgnoreParenImpCasts()) {
                        std::string baseName = clang::Lexer::getSourceText(clang::CharSourceRange::getTokenRange(baseExpr->getSourceRange()), SM, Rewriter.getLangOpts()).str();
                        std::string fieldName = memberExpr->getMemberDecl()->getNameAsString();
                        std::string fullName = baseName + (memberExpr->isArrow() ? "->" : ".") + fieldName;
                        std::string nondetID = GenerateNondetID(fullName);
                        auto iterator = std::find_if(assignments.begin(), assignments.end(), [&](const NondetAssignment &assignment) { return assignment.id == nondetID; });
                        if (iterator != assignments.end()) {
                            Rewriter.ReplaceText(rightCallExpr->getSourceRange(), iterator->value);
                            processedNondetCalls.insert(rightCallExpr);
                        }
                    }
                }
            }
        }
    }
    return true;
}

bool concretizer::VisitorAndRewriter::VisitIfStmt(clang::IfStmt *IS) {
    clang::SourceManager &SM = Rewriter.getSourceMgr();
    if (SM.isInMainFile(IS->getBeginLoc())) {
        if (clang::Expr *condExpr = IS->getCond()) {
            ProcessIfCondition(condExpr);
        }
    }
    return true;
}

bool concretizer::VisitorAndRewriter::VisitReturnStmt(clang::ReturnStmt *RS) {
    clang::SourceManager &SM = Rewriter.getSourceMgr();
    if (SM.isInMainFile(RS->getBeginLoc())) {
        if (clang::Expr *retExpr = RS->getRetValue()) {
            clang::Expr *innerExpr = retExpr->IgnoreParenImpCasts();
            if (clang::CallExpr *callExpr = llvm::dyn_cast<clang::CallExpr>(innerExpr)) {
                std::string nondetID = GenerateNondetID("NONDET_RETURN");
                auto iterator = std::find_if(assignments.begin(), assignments.end(), [&](const NondetAssignment &assignment) { return assignment.id == nondetID; });
                if (iterator != assignments.end()) {
                    Rewriter.ReplaceText(callExpr->getSourceRange(), iterator->value);
                    processedNondetCalls.insert(callExpr);
                }
            }
        }
    }
    return true;
}

void concretizer::VisitorAndRewriter::ProcessIfCondition(clang::Expr *condExpr) {
    if (!condExpr) return;

    condExpr = condExpr->IgnoreParenImpCasts();

    if (auto *unaryOp = llvm::dyn_cast<clang::UnaryOperator>(condExpr)) {
        ProcessIfCondition(unaryOp->getSubExpr());
        return;
    }

    if (auto *binaryOp = llvm::dyn_cast<clang::BinaryOperator>(condExpr)) {
        ProcessIfCondition(binaryOp->getLHS());
        ProcessIfCondition(binaryOp->getRHS());
        return;
    }

    if (auto *callExpr = llvm::dyn_cast<clang::CallExpr>(condExpr)) {
        if (IsNondetCall(callExpr) && !processedNondetCalls.contains(callExpr)) {
            std::string nondetID = GenerateNondetID("NONDET_IF");
            auto iterator = std::find_if(assignments.begin(), assignments.end(), [&](const NondetAssignment &assignment) { return assignment.id == nondetID; });
            if (iterator != assignments.end()) {
                Rewriter.ReplaceText(callExpr->getSourceRange(), iterator->value);
                processedNondetCalls.insert(callExpr);
            }
        }
    }
}