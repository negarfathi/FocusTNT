#include "../../include/nondet_extractor/visitor_and_rewriter.h"

bool nondet_extractor::VisitorAndRewriter::IsNondetCall(const clang::CallExpr *callExpr) {
    if (callExpr == nullptr) {
        return false;
    }
    const clang::FunctionDecl *funcDecl = callExpr->getDirectCallee();
    if (funcDecl == nullptr) {
        return false;
    }
    return funcDecl->getNameAsString().starts_with("__VERIFIER_nondet_");
}

std::string nondet_extractor::VisitorAndRewriter::GenerateNondetID(const std::string &variableName) {
    unsigned occurrence = ++nondetOccurrenceCounts[currentFunctionName + ":" + variableName];
    return currentFunctionName + ":" + variableName + ":" + std::to_string(occurrence);
}

bool nondet_extractor::VisitorAndRewriter::VisitFunctionDecl(clang::FunctionDecl *FD) {
    clang::SourceManager &SM = Context->getSourceManager();
    if (SM.isInMainFile(FD->getBeginLoc()) && FD->doesThisDeclarationHaveABody()) {
        currentFunctionName = FD->getNameAsString();
        if (auto position = currentFunctionName.find("_slice"); position != std::string::npos) {
            currentFunctionName = currentFunctionName.substr(0, position);
        }
    }
    return true;
}

bool nondet_extractor::VisitorAndRewriter::VisitVarDecl(clang::VarDecl *VD) {
    clang::SourceManager &SM = Context->getSourceManager();

    if (SM.isInMainFile(VD->getBeginLoc())) {
        if (VD->hasInit()) {
            clang::Expr *initExpr = VD->getInit()->IgnoreParenImpCasts();
            clang::CallExpr *initCallExpr = llvm::dyn_cast<clang::CallExpr>(initExpr);
            if (IsNondetCall(initCallExpr)) {
                NondetInput input;
                input.id = GenerateNondetID(VD->getNameAsString());
                input.type = VD->getType().getAsString();
                inputs.push_back(std::move(input));
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
            std::string arrayDeclarationStr = clang::Lexer::getSourceText(clang::CharSourceRange::getTokenRange(VD->getSourceRange()), SM, Context->getLangOpts()).str();
            std::string arrSize;
            auto leftPos = arrayDeclarationStr.find('[');
            auto rightPos = arrayDeclarationStr.find(']');
            if (leftPos != std::string::npos && rightPos != std::string::npos && rightPos > leftPos) {
                arrSize = arrayDeclarationStr.substr(leftPos + 1, rightPos - leftPos - 1);
            }
            arrayDeclaration.sizeExpression = arrSize;
            arrayDeclarations[currentFunctionName + ":" + arrayDeclaration.name] = arrayDeclaration;
        }
    }
    return true;
}

bool nondet_extractor::VisitorAndRewriter::VisitBinaryOperator(clang::BinaryOperator *BO) {
    clang::SourceManager &SM = Context->getSourceManager();

    if (SM.isInMainFile(BO->getBeginLoc())) {
        if (BO->getOpcode() == clang::BO_Assign) {
            clang::Expr *rightExpr = BO->getRHS()->IgnoreParenImpCasts();
            clang::CallExpr *rightCallExpr = llvm::dyn_cast<clang::CallExpr>(rightExpr);
            if (IsNondetCall(rightCallExpr)) {
                clang::Expr *leftExpr = BO->getLHS()->IgnoreParenImpCasts();

                // Simple variable
                if (auto *DRE = llvm::dyn_cast<clang::DeclRefExpr>(leftExpr)) {
                    if (auto *varDecl = llvm::dyn_cast<clang::VarDecl>(DRE->getDecl())) {
                        NondetInput input;
                        input.id = GenerateNondetID(varDecl->getNameAsString());
                        input.type = varDecl->getType().getAsString();
                        inputs.push_back(std::move(input));
                        processedNondetCalls.insert(rightCallExpr);
                    }
                }

                // Array element
                else if (auto *ASE = llvm::dyn_cast<clang::ArraySubscriptExpr>(leftExpr)) {
                    if (auto *DRE = llvm::dyn_cast<clang::DeclRefExpr>(ASE->getBase()->IgnoreParenImpCasts())) {
                        if (auto *arrayDecl = llvm::dyn_cast<clang::VarDecl>(DRE->getDecl())) {
                            std::string arrayName = arrayDecl->getNameAsString();
                            auto iterator = arrayDeclarations.find(currentFunctionName + ":" + arrayName);
                            if (iterator != arrayDeclarations.end()) {
                                NondetInput input;
                                input.id = GenerateNondetID(arrayName);
                                input.type = iterator->second.elementType;
                                input.isArray = true;
                                input.arraySizeExpresion = iterator->second.sizeExpression;
                                inputs.push_back(std::move(input));
                                processedNondetCalls.insert(rightCallExpr);
                            }
                        }
                    }
                }

                // Struct field
                else if (auto *memberExpr = llvm::dyn_cast<clang::MemberExpr>(leftExpr)) {
                    if (auto *baseExpr = memberExpr->getBase()->IgnoreParenImpCasts()) {
                        std::string baseName = clang::Lexer::getSourceText(clang::CharSourceRange::getTokenRange(baseExpr->getSourceRange()), SM, Context->getLangOpts()).str();
                        std::string fieldName = memberExpr->getMemberDecl()->getNameAsString();
                        std::string fullName = baseName + (memberExpr->isArrow() ? "->" : ".") + fieldName;
                        NondetInput input;
                        input.id = GenerateNondetID(fullName);
                        input.type = memberExpr->getType().getAsString();
                        inputs.push_back(std::move(input));
                        processedNondetCalls.insert(rightCallExpr);
                    }
                }
            }
        }
    }
    return true;
}

bool nondet_extractor::VisitorAndRewriter::VisitIfStmt(clang::IfStmt *IS) {
    clang::SourceManager &SM = Context->getSourceManager();
    if (SM.isInMainFile(IS->getBeginLoc())) {
        if (clang::Expr *condExpr = IS->getCond()) {
            ProcessIfCondition(condExpr);
        }
    }
    return true;
}

bool nondet_extractor::VisitorAndRewriter::VisitReturnStmt(clang::ReturnStmt *RS) {
    clang::SourceManager &SM = Context->getSourceManager();
    if (SM.isInMainFile(RS->getBeginLoc())) {
        if (clang::Expr *retExpr = RS->getRetValue()) {
            clang::Expr *innerExpr = retExpr->IgnoreParenImpCasts();
            clang::CallExpr *callExpr = llvm::dyn_cast<clang::CallExpr>(innerExpr);
            if (IsNondetCall(callExpr)) {
                NondetInput input;
                input.id = GenerateNondetID("NONDET_RETURN");
                input.type = callExpr->getType().getAsString();
                inputs.push_back(std::move(input));
                processedNondetCalls.insert(callExpr);
            }
        }
    }
    return true;
}

void nondet_extractor::VisitorAndRewriter::ProcessIfCondition(clang::Expr *condExpr) {
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
            NondetInput input;
            input.id = GenerateNondetID("NONDET_IF");
            input.type = callExpr->getType().getAsString();
            inputs.push_back(std::move(input));
            processedNondetCalls.insert(callExpr);
        }
    }
}