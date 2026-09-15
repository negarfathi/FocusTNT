#ifndef RESULT_RECORDER_H
#define RESULT_RECORDER_H

#include <regex>
#include <fstream>
#include <sstream>
#include <xlnt/xlnt.hpp>

void RecordResults(const std::filesystem::path &excelPath, const std::filesystem::path &sourceCodePath, const std::filesystem::path &resultsDirectory, const std::vector<std::filesystem::path> &variantsToAnalyze, int numLoops, int numNondetInputs, const std::string &toolName, const std::string &benchmarkName, const std::string &configurationFlag, const std::filesystem::path &groundTruthPath);

#endif //RESULT_RECORDER_H