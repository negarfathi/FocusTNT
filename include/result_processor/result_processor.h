#ifndef RESULT_PROCESSOR_H
#define RESULT_PROCESSOR_H

#include <regex>
#include <fstream>
#include <numeric>
#include <sstream>
#include <xlnt/xlnt.hpp>

std::string CollectVariantResults(const std::string &sourceCodeDirectory, const std::string &toolName);

std::vector<std::string> EvaluateToolDecisionAndMetrics(const std::string &variantResults, const std::string &groundTruthPath, const std::string &sourceCodeName);

std::array<std::string, 7> ParseToolDecision(const std::string &toolDecision);
std::array<std::string, 2> ParseSolveRate(const std::string &solveRate);
void WriteResultsToExcel(const std::string &excelPath, const std::string &toolName, const std::string &sourceCodeName, const std::string &slicerFlag, const std::string &concretizerFlag, const std::vector<std::string> &results);

#endif //RESULT_PROCESSOR_H