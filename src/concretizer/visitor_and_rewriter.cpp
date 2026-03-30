#include "../../include/concretizer/visitor_and_rewriter.h"

bool concretizer::VisitorAndRewriter::VisitFunctionDecl(clang::FunctionDecl *FD) {
    clang::SourceManager &SM = Rewriter.getSourceMgr();
    if (SM.isInMainFile(FD->getBeginLoc())) {
        currentFuncName = FD->getNameAsString();
    }
    return true;
}

bool concretizer::VisitorAndRewriter::VisitVarDecl(clang::VarDecl *VD) {
    clang::SourceManager &SM = Rewriter.getSourceMgr();
    if (SM.isInMainFile(VD->getBeginLoc())) {
        if (VD->hasInit()) {
            clang::Expr *initExpr = VD->getInit()->IgnoreParenImpCasts();
            if (clang::CallExpr *initCallExpr = llvm::dyn_cast<clang::CallExpr>(initExpr)) {
                if (clang::FunctionDecl *funcDecl = initCallExpr->getDirectCallee()) {
                    std::string funcName = funcDecl->getNameAsString();
                    if (funcName.starts_with("__VERIFIER_nondet_")) {
                        std::string varName = VD->getNameAsString();
                        auto it = std::find_if(assignments.begin(), assignments.end(), [&](const VariableAssignment& a){ return a.name == varName; });
                        if (it == assignments.end()) {
                            std::string baseName = currentFuncName;
                            if (auto position = baseName.find("_slice"); position != std::string::npos) {
                                baseName = baseName.substr(0, position);
                            }
                            auto itFallback = std::find_if(assignments.begin(), assignments.end(), [&](const VariableAssignment &a) { return a.name.starts_with("RETURN_" + baseName) || a.name.starts_with("IF_" + baseName); });
                            if (itFallback != assignments.end()) {
                                Rewriter.ReplaceText(initCallExpr->getSourceRange(), itFallback->value);
                            }
                        }
                        else {
                            Rewriter.ReplaceText(initCallExpr->getSourceRange(), it->value);
                        }
                    }
                }
            }
        }
        else {
            if (auto *AT = llvm::dyn_cast<clang::ArrayType>(VD->getType().getTypePtr())) {
                ArrDecl arrDecl;
                arrDecl.name = VD->getNameAsString();
                arrDecl.type = VD->getType()->getAsArrayTypeUnsafe()->getElementType().getAsString();
                if (llvm::dyn_cast<clang::ConstantArrayType>(AT)) {
                    arrDecl.isConstantSize = true;
                }
                else {
                    arrDecl.isConstantSize = false;
                }
                std::string arrDeclStr = clang::Lexer::getSourceText(clang::CharSourceRange::getTokenRange(VD->getSourceRange()), SM, Rewriter.getLangOpts()).str();
                std::string arrSizeStr;
                auto leftPos = arrDeclStr.find('[');
                auto rightPos = arrDeclStr.find(']');
                if (leftPos != std::string::npos && rightPos != std::string::npos && rightPos > leftPos) {
                    arrSizeStr = arrDeclStr.substr(leftPos + 1, rightPos - leftPos - 1);
                }
                arrDecl.sizeExpr = arrSizeStr;
                arrDecl.declRange = VD->getSourceRange();
                arrDecls[arrDecl.name] = arrDecl;
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
            if (clang::CallExpr *rightCallExpr = llvm::dyn_cast<clang::CallExpr>(rightExpr)) {
                if (clang::FunctionDecl *funcDecl = rightCallExpr->getDirectCallee()) {
                    std::string funcName = funcDecl->getNameAsString();
                    if (funcName.starts_with("__VERIFIER_nondet_")) {
                        clang::Expr *leftExpr = BO->getLHS()->IgnoreParenImpCasts();

                        // Simple Variable
                        if (auto *DRE = llvm::dyn_cast<clang::DeclRefExpr>(leftExpr)) {
                            if (auto *varDecl = llvm::dyn_cast<clang::VarDecl>(DRE->getDecl())) {
                                std::string varName = varDecl->getNameAsString();
                                auto it = std::find_if(assignments.begin(), assignments.end(), [&](const VariableAssignment &a){ return a.name == varName; });
                                if (it == assignments.end()) {
                                    std::string baseName = currentFuncName;
                                    if (auto position = baseName.find("_slice"); position != std::string::npos) {
                                        baseName = baseName.substr(0, position);
                                    }
                                    auto itFallback = std::find_if(assignments.begin(), assignments.end(), [&](const VariableAssignment &a) { return a.name== "RETURN_" + baseName || a.name == "IF_" + baseName; });
                                    if (itFallback != assignments.end()) {
                                        Rewriter.ReplaceText(rightCallExpr->getSourceRange(), itFallback->value);
                                    }
                                }
                                else {
                                    Rewriter.ReplaceText(rightCallExpr->getSourceRange(), it->value);
                                }
                            }
                        }

                        // Array Element
                        else if (auto *ASE = llvm::dyn_cast<clang::ArraySubscriptExpr>(leftExpr)) {
                            if (auto *DRE = llvm::dyn_cast<clang::DeclRefExpr>(ASE->getBase()->IgnoreParenImpCasts())) {
                                if (auto *arrDecl = llvm::dyn_cast<clang::VarDecl>(DRE->getDecl())) {
                                    std::string arrName = arrDecl->getNameAsString();
                                    auto it = std::find_if(assignments.begin(), assignments.end(), [&](const VariableAssignment &a){ return a.name == arrName; });
                                    if (it != assignments.end()) {
                                        auto itArrDecl = arrDecls.find(arrName);
                                        if (itArrDecl != arrDecls.end()) {
                                            std::string sizeStr;
                                            if (itArrDecl->second.isConstantSize) {
                                                sizeStr = itArrDecl->second.sizeExpr;
                                            } else {
                                                auto itArrSize = std::find_if(assignments.begin(), assignments.end(), [&](const VariableAssignment &a){ return a.name == itArrDecl->second.sizeExpr; });
                                                if (itArrSize != assignments.end()) {
                                                    sizeStr = itArrSize->value;
                                                }
                                            }
                                            std::string initStr;
                                            if (itArrDecl->second.type.find("char") != std::string::npos) {
                                                initStr = "\"" + it->value + "\"";
                                            } else {
                                                initStr = it->value;
                                            }
                                            std::string newArrDecl = itArrDecl->second.type + " " + itArrDecl->second.name + "[" + sizeStr + "] = " + initStr;
                                            Rewriter.ReplaceText(BO->getSourceRange(), "");
                                            Rewriter.ReplaceText(itArrDecl->second.declRange, newArrDecl);
                                        }
                                    }
                                }
                            }
                        }

                        // Struct Field
                        else if (auto *memberExpr = llvm::dyn_cast<clang::MemberExpr>(leftExpr)) {
                            if (auto *baseExpr = memberExpr->getBase()->IgnoreParenImpCasts()) {
                                std::string baseName = clang::Lexer::getSourceText(clang::CharSourceRange::getTokenRange(baseExpr->getSourceRange()), Rewriter.getSourceMgr(), Rewriter.getLangOpts()).str();
                                std::string fieldName = memberExpr->getMemberDecl()->getNameAsString();
                                std::string fullName = baseName + (memberExpr->isArrow() ? "->" : ".") + fieldName;
                                auto it = std::find_if(assignments.begin(), assignments.end(), [&](const VariableAssignment &a){ return a.name == fullName; });
                                if (it != assignments.end()) {
                                    Rewriter.ReplaceText(rightCallExpr->getSourceRange(), it->value);
                                }
                            }
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
                if (clang::FunctionDecl *funcDecl = callExpr->getDirectCallee()) {
                    std::string funcName = funcDecl->getNameAsString();
                    if (funcName.starts_with("__VERIFIER_nondet_")) {
                        auto it = std::find_if(assignments.begin(), assignments.end(), [&](const VariableAssignment& a){ return a.name == "RETURN_" + currentFuncName; });
                        if (it != assignments.end()) {
                            Rewriter.ReplaceText(callExpr->getSourceRange(), it->value);
                        }
                    }
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
        if (auto *funcDecl = callExpr->getDirectCallee()) {
            std::string funcName = funcDecl->getNameAsString();
            if (funcName.starts_with("__VERIFIER_nondet_")) {
                auto it = std::find_if(assignments.begin(), assignments.end(), [&](const VariableAssignment& a){ return a.name == "IF_" + currentFuncName; });
                if (it != assignments.end()) {
                    Rewriter.ReplaceText(callExpr->getSourceRange(), it->value);
                }
            }
        }
        return;
    }
}