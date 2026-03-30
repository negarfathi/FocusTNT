#include "../../include/result_processor/result_processor.h"

std::string CollectVariantResults(const std::string &sourceCodePath, const std::string &toolName) {
    std::ostringstream variantResults;

    for (const auto &entry : std::filesystem::directory_iterator(sourceCodePath)) {
        if (!entry.is_regular_file() || entry.path().extension() != ".txt") {
            continue;
        }

        std::string txtName = entry.path().stem().string();

        std::string line;
        std::vector<std::string> lines;
        std::ifstream txtStream(entry.path());
        while (std::getline(txtStream, line)) {
            if (!line.empty()) {
                lines.push_back(line);
            }
        }

        std::string result;
        std::string runtime;

        if (toolName == "Athena") {
            std::regex pattern("^(YES|NO|MAYBE|TIMEOUT|ERROR)$", std::regex_constants::icase);
            for (auto it = lines.rbegin(); it != lines.rend(); it++) {
                if (std::regex_match(*it, pattern)) {
                    result = *it;
                    break;
                }
            }
            if (result.empty()) result = "ERROR";
        }

        else if (toolName == "PROTON") {
            std::regex pattern("^(TRUE|FALSE\\(termination\\)|INCONCLUSIVE|Terminated|INTERNAL-ERROR)$", std::regex_constants::icase);
            for (auto it = lines.rbegin(); it != lines.rend(); it++) {
                if (std::regex_match(*it, pattern)) {
                    result = *it;
                    break;
                }
            }
            if (result.empty()) result = "ERROR";
        }

        else if (toolName == "UAutomizer") {
            for (int i = static_cast<int>(lines.size()) - 1; i >= 0; i--) {
                if (lines[i].rfind("Result:", 0) == 0 && i + 1 < static_cast<int>(lines.size())) {
                    result = lines[i + 1];
                    break;
                }
            }
            if (result == "FALSE(TERM)") result = "FALSE";
            if (result.find("ERROR") != std::string::npos || result.empty()) result = "Error";
        }

        else if (toolName == "AProVE") {
            std::regex pattern("^(YES|NO|MAYBE|TIMEOUT|ERROR)$", std::regex_constants::icase);
            for (auto it = lines.begin(); it != lines.end(); it++) {
                if (std::regex_match(*it, pattern)) {
                    result = *it;
                    break;
                }
            }
            if (result.empty()) result = "ERROR";
        }

        else if (toolName == "CPAchecker") {
            std::regex pattern(R"(Verification result:\s([^.,]+)[.,])", std::regex_constants::icase);
            std::smatch matches;
            for (auto it = lines.rbegin(); it != lines.rend(); it++) {
                if (std::regex_search(*it, matches, pattern)) {
                    result = matches[1];
                    break;
                }
            }
            if (result.empty()) result = "ERROR";
        }

        else if (toolName == "2LS") {
            std::regex pattern(R"(\[main\]:\s*([A-Za-z]+))", std::regex_constants::icase);
            std::smatch matches;
            for (auto it = lines.rbegin(); it != lines.rend(); it++) {
                if (std::regex_search(*it, matches, pattern)) {
                    result = matches[1];
                    break;
                }
            }
            if (result.empty()) result = "error";
        }

        for (auto it = lines.rbegin(); it != lines.rend(); it++) {
            if (it->find("Runtime:") != std::string::npos) {
                std::smatch matches;
                if (std::regex_search(*it, matches, std::regex("([0-9]+)"))) {
                    runtime = matches[1];
                }
                break;
            }
        }

        variantResults << "(" << txtName << ", " << result << ", " << runtime << ")\n";
    }

    return variantResults.str();
}



std::vector<std::string> EvaluateToolDecisionAndMetrics(const std::string &variantResults, const std::string &groundTruthPath, const std::string &sourceCodeName) {
    std::ifstream groundTruthStream(groundTruthPath);
    if (!groundTruthStream.is_open()) {
        return {"", "", "", "", ""};
    }
    static std::unordered_map<std::string, std::string> GT_Dictionary;
    std::string line1;
    while (std::getline(groundTruthStream, line1)) {
        if (line1.empty()) continue;
        size_t commaPos = line1.find(',');
        if (commaPos == std::string::npos) continue;
        GT_Dictionary[line1.substr(0, commaPos)] = line1.substr(commaPos + 1);
    }



    auto it = GT_Dictionary.find(sourceCodeName + "_Loop0_TestCase0");
    if (it == GT_Dictionary.end()) {
        return {"", "", "", "", ""};
    }
    const std::string &GT_Program = it->second;



    struct Variant {
        std::string name;
        std::string normalizedResult;
        int runtime;
    };
    std::vector<Variant> variants;

    bool prefixFiltered = false;
    static const std::vector<std::string> prefixes = {
        "FSE_Bitvector_Mode_",
        "FSE_Modulo_Arithmetic_Mode_",
        "FSE_Mathematical_Integer_Mode_"
    };

    auto NormalizeResult = [](std::string result) {
        std::transform(result.begin(), result.end(), result.begin(), ::toupper);
        if (result=="YES" || result=="TRUE")
            return std::string("YES");
        if (result=="NO" || result=="FALSE" || result=="FALSE(TERMINATION)")
            return std::string("NO");
        if (result=="MAYBE" || result=="UNKNOWN" || result=="INCONCLUSIVE" || result=="TIMEOUT" || result=="TERMINATED" || result=="ERROR" || result=="INTERNAL-ERROR")
            return std::string("UNKNOWN");
        return std::string("UNKNOWN");
    };

    auto ComputePercentage = [](int solved, int total) -> double {
        return (total > 0) ? (100.0 * solved / total) : 0.0;
    };

    std::istringstream stream(variantResults);
    std::string line2;
    std::regex pattern(R"(\(([^,]+),\s*([^,]+),\s*([^\)]+)\))");
    while (std::getline(stream, line2)) {
        std::smatch matches;
        if (!std::regex_search(line2, matches, pattern)) continue;
        std::string name = matches[1];
        for (const auto& prefix : prefixes) {
            if (name.rfind(prefix, 0) == 0) {
                name.erase(0, prefix.size());
                prefixFiltered = true;
                break;
            }
        }
        std::string normalizedResult = NormalizeResult(matches[2]);
        int runtime = std::stoi(matches[3]);
        variants.push_back({name, normalizedResult, runtime});
    }



    std::string toolDecision = "";
    if (GT_Program == "T") {
        if (!prefixFiltered) {
            for (const auto &variant : variants) {
                if (variant.normalizedResult == "NO") {
                    toolDecision = "wrong";
                    break;
                }
            }
        }
        if (toolDecision != "wrong") {
            int solved_T = 0;
            for (const auto &variant : variants) {
                if (variant.normalizedResult == "YES") {
                    solved_T = solved_T + 1;
                }
            }
            std::ostringstream oss;
            oss << "correct, " << std::fixed << std::setprecision(2) << ComputePercentage(solved_T, variants.size()) << "% (" << solved_T << "/" << variants.size() << ")";
            toolDecision = oss.str();
        }
    }
    else {
        if (!prefixFiltered) {
            for (const auto &variant : variants) {
                auto itGT = GT_Dictionary.find(variant.name);
                if (itGT == GT_Dictionary.end()) {
                    return {"", "", "", "", ""};
                }
                const std::string &GT_Variant = itGT->second;
                if ((GT_Variant == "T"  && variant.normalizedResult == "NO") || (GT_Variant == "NT" && variant.normalizedResult == "YES")) {
                    toolDecision = "wrong";
                    break;
                }
            }
        }
        if (toolDecision != "wrong") {
            int total_T = 0, solved_T = 0;
            int total_NT = 0, solved_NT = 0;
            for (const auto &variant : variants) {
                auto itGT = GT_Dictionary.find(variant.name);
                if (itGT == GT_Dictionary.end()) {
                    return {"", "", "", "", ""};
                }
                const std::string &GT_Variant = itGT->second;
                if (GT_Variant == "T") {
                    total_T = total_T + 1;
                    if (variant.normalizedResult == "YES") {
                        solved_T = solved_T + 1;
                    }
                }
                else if (GT_Variant == "NT") {
                    total_NT = total_NT + 1;
                    if (variant.normalizedResult == "NO") {
                        solved_NT = solved_NT + 1;
                    }
                }
            }
            std::ostringstream oss;
            oss << "correct, " << std::fixed << std::setprecision(2) << ComputePercentage(solved_T, total_T) << "% (" << solved_T << "/" << total_T << "), " << ComputePercentage(solved_NT, total_NT) << "% (" << solved_NT << "/" << total_NT << ")";
            toolDecision = oss.str();
        }
    }



    std::vector<int> runtime_CorrectVariants;
    runtime_CorrectVariants.reserve(variants.size());
    int count_CorrectVariants = 0;
    for (const auto &variant : variants) {
        auto itGT = GT_Dictionary.find(variant.name);
        if (itGT == GT_Dictionary.end()) {
            return {"", "", "", "", ""};
        }
        std::string GT_Variant = itGT->second;
        const bool isCorrect = (GT_Variant == "T"  && variant.normalizedResult == "YES") || (GT_Variant == "NT" && variant.normalizedResult == "NO");
        if (isCorrect) {
            count_CorrectVariants++;
            runtime_CorrectVariants.push_back(variant.runtime);
        }
    }

    double SR = 0.0;
    if (variants.size() > 0) {
        SR = 100.0 * static_cast<double>(count_CorrectVariants) / static_cast<double>(variants.size());
    }

    long long TVT = 0;
    for (int runtime : runtime_CorrectVariants) {
        TVT = TVT + static_cast<long long>(runtime);
    }

    double AVT = 0.0;
    double MVT = 0.0;
    if (count_CorrectVariants > 0) {
        AVT = static_cast<double>(TVT) / static_cast<double>(count_CorrectVariants);

        std::sort(runtime_CorrectVariants.begin(), runtime_CorrectVariants.end());
        if (count_CorrectVariants % 2 == 1) {
            MVT = static_cast<double>(runtime_CorrectVariants[count_CorrectVariants / 2]);
        }
        else {
            const int mid = count_CorrectVariants / 2;
            MVT = 0.5 * (static_cast<double>(runtime_CorrectVariants[mid - 1]) + static_cast<double>(runtime_CorrectVariants[mid]));
        }
    }



    std::ostringstream sr, tvt, avt, mvt;
    sr << std::fixed << std::setprecision(2) << SR << "% (" << count_CorrectVariants << "/" << variants.size() << ")";
    tvt << TVT;
    if (count_CorrectVariants > 0) {
        avt << std::fixed << std::setprecision(2) << AVT;
        mvt << std::fixed << std::setprecision(2) << MVT;
    }
    else {
        avt << "0";
        mvt << "0";
    }

    return {toolDecision, sr.str(), tvt.str(), avt.str(), mvt.str()};
}



std::array<std::string, 7> ParseToolDecision(const std::string &toolDecision) {
    std::array<std::string, 7> items = {"", "", "", "", "", "", ""};
    auto Trim = [](const std::string &text) {
        size_t begin = 0;
        size_t end = text.size();
        while (begin < end && std::isspace(static_cast<unsigned char>(text[begin]))) begin++;
        while (end > begin && std::isspace(static_cast<unsigned char>(text[end - 1]))) end--;
        return text.substr(begin, end - begin);
    };

    std::string currentToken;
    std::vector<std::string> tokens;
    for (char c : toolDecision) {
        if (c == ',') {
            tokens.push_back(Trim(currentToken));
            currentToken.clear();
        }
        else {
            currentToken.push_back(c);
        }
    }
    tokens.push_back(Trim(currentToken));
    items[0] = tokens[0];
    if (items[0] == "wrong") {
        return items;
    }
    int extractedPairCount = 0;
    for (size_t tokenIndex = 1; tokenIndex < tokens.size() && extractedPairCount < 3; tokenIndex++) {
        const std::string &token = tokens[tokenIndex];
        size_t percentPos = token.find('%');
        size_t leftParenthesisPos  = token.find('(');
        size_t rightParenthesisPos = token.find(')');
        items[1 + extractedPairCount * 2] = Trim(token.substr(0, percentPos + 1));
        items[2 + extractedPairCount * 2] = Trim(token.substr(leftParenthesisPos + 1, rightParenthesisPos - leftParenthesisPos - 1));
        extractedPairCount++;
    }
    return items;
}

std::array<std::string, 2> ParseSolveRate(const std::string &solveRate) {
    auto Trim = [](const std::string &text) {
        size_t begin = 0;
        size_t end = text.size();
        while (begin < end && std::isspace(static_cast<unsigned char>(text[begin]))) begin++;
        while (end > begin && std::isspace(static_cast<unsigned char>(text[end - 1]))) end--;
        return text.substr(begin, end - begin);
    };
    size_t percentPos = solveRate.find('%');
    size_t leftParenthesisPos = solveRate.find('(');
    size_t rightParenthesisPos = solveRate.find(')');
    std::string percentage = Trim(solveRate.substr(0, percentPos + 1));
    std::string ratio = Trim(solveRate.substr(leftParenthesisPos + 1, rightParenthesisPos - leftParenthesisPos - 1));
    return {percentage, ratio};
}

void WriteResultsToExcel(const std::string &excelPath, const std::string &toolName, const std::string &sourceCodeName, const std::string &slicerFlag, const std::string &concretizerFlag, const std::vector<std::string> &results) {
    xlnt::workbook wb;

    if (std::filesystem::exists(excelPath)) {
        wb.load(excelPath);
    }

    auto getSheet = [&](const std::string &tool_name) -> xlnt::worksheet {
        if (wb.contains(tool_name)) {
            return wb.sheet_by_title(tool_name);
        }
        auto ws = wb.create_sheet();
        ws.title(tool_name);
        return ws;
    };
    xlnt::worksheet ws = getSheet(toolName);

    auto getRow = [&](xlnt::worksheet &ws, const std::string &source_code_name) -> int {
        int lastRow = ws.highest_row();
        for (int i = 3; i <= lastRow; ++i) {
            if (ws.cell("B" + std::to_string(i)).to_string() == source_code_name) {
                return i;
            }
        }
        return (lastRow < 3) ? 3 : lastRow + 1;
    };
    int row = getRow(ws, sourceCodeName);

    int baseColumn;
    if (slicerFlag == "false" && concretizerFlag == "false") baseColumn = 3;
    else if (slicerFlag == "true" && concretizerFlag == "false") baseColumn = 14;
    else if (slicerFlag == "false" && concretizerFlag == "true") baseColumn = 25;
    else baseColumn = 36;

    ws.cell("B" + std::to_string(row)).value(sourceCodeName);
    ws.cell(xlnt::cell_reference(baseColumn, row)).value(results[0]);
    std::array<std::string, 7> toolDecision = ParseToolDecision(results[1]);
    for (int i = 0; i < 7; i++) {
        ws.cell(xlnt::cell_reference(baseColumn + (i + 1), row)).value(toolDecision[i]);
    }
    std::array<std::string, 2> solveRate = ParseSolveRate(results[2]);
    for (int i = 0; i < 2; i++) {
        ws.cell(xlnt::cell_reference(baseColumn + 5 + (i + 1), row)).value(solveRate[i]);
    }
    ws.cell(xlnt::cell_reference(baseColumn + 8, row)).value(results[3]);
    ws.cell(xlnt::cell_reference(baseColumn + 9, row)).value(results[4]);
    ws.cell(xlnt::cell_reference(baseColumn + 10, row)).value(results[5]);

    wb.save(excelPath);

    std::cout << "Results written to: " << excelPath << "\n";
}