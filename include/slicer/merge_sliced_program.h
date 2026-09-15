#ifndef MERGE_SLICED_PROGRAM_H
#define MERGE_SLICED_PROGRAM_H

#include <filesystem>

#include <clang/Tooling/Tooling.h>
#include <clang/Rewrite/Core/Rewriter.h>
#include <clang/AST/RecursiveASTVisitor.h>

void mergeSlicedPrograms(std::string &slicedProgram1, std::string &slicedProgram2, std::string &functionName, std::filesystem::path &mergedSlicedProgram);

#endif //MERGE_SLICED_PROGRAM_H