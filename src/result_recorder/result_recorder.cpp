#include "../../include/result_recorder/result_recorder.h"

std::string NormalizeVerdict(std::string result) {
    result.erase(result.begin(), std::find_if(result.begin(), result.end(), [](unsigned char c) { return !std::isspace(c); }));
    result.erase(std::find_if(result.rbegin(), result.rend(), [](unsigned char c) { return !std::isspace(c); }).base(), result.end());
    std::transform(result.begin(), result.end(), result.begin(), [](unsigned char c) { return static_cast<char>(std::toupper(c)); });
    if (result == "YES" || result == "TRUE") {
        return "YES";
    }
    if (result == "NO" || result == "FALSE" || result == "FALSE(TERM)" || result == "FALSE(TERMINATION)") {
        return "NO";
    }
    if (result == "TIMEOUT" || result == "TERMINATED") {
        return "TIMEOUT";
    }
    if (result == "ERROR" || result == "INTERNAL-ERROR") {
        return "ERROR";
    }
    if (result == "MAYBE" || result == "UNKNOWN" || result == "INCONCLUSIVE") {
        return "UNKNOWN";
    }
    return "UNKNOWN";
}


std::tuple<std::string, long long, long long> ReadAnalyzerResult(const std::filesystem::path &resultPath, const std::string &toolName) {
    std::ifstream resultStream(resultPath);
    std::vector<std::string> lines;
    std::string line;
    while (std::getline(resultStream, line)) {
        line.erase(line.begin(), std::find_if(line.begin(), line.end(), [](unsigned char c) { return !std::isspace(c); }));
        line.erase(std::find_if(line.rbegin(), line.rend(), [](unsigned char c) { return !std::isspace(c); }).base(), line.end());
        if (!line.empty()) {
            lines.push_back(line);
        }
    }
    resultStream.close();

    std::string result;
    if (toolName == "Athena" || toolName == "Athena_BV" || toolName == "Athena_MA" || toolName == "Athena_MI") {
        std::regex pattern("^(YES|NO|MAYBE|TIMEOUT|ERROR)$", std::regex_constants::icase);
        for (auto it = lines.rbegin(); it != lines.rend(); it++) {
            if (std::regex_match(*it, pattern)) {
                result = *it;
                break;
            }
        }
    }
    else if (toolName == "PROTON") {
        std::regex pattern("^(TRUE|FALSE\\(termination\\)|INCONCLUSIVE|Terminated|INTERNAL-ERROR)$", std::regex_constants::icase);
        for (auto it = lines.rbegin(); it != lines.rend(); it++) {
            if (std::regex_match(*it, pattern)) {
                result = *it;
                break;
            }
        }
    }
    else if (toolName == "UAutomizer") {
        for (int i = static_cast<int>(lines.size()) - 1; i >= 0; i--) {
            if (lines[i].rfind("Result:", 0) == 0 && i + 1 < static_cast<int>(lines.size())) {
                result = lines[i + 1];
                break;
            }
        }
    }
    else if (toolName == "AProVE") {
        std::regex pattern("^(YES|NO|MAYBE|TIMEOUT|ERROR)$", std::regex_constants::icase);
        for (auto it = lines.begin(); it != lines.end(); it++) {
            if (std::regex_match(*it, pattern)) {
                result = *it;
                break;
            }
        }
    }
    else if (toolName == "CPAchecker") {
        std::regex pattern(R"(Verification result:\s*([^.,]+)[.,])", std::regex_constants::icase);
        std::smatch matches;
        for (auto it = lines.rbegin(); it != lines.rend(); it++) {
            if (std::regex_search(*it, matches, pattern)) {
                result = matches[1].str();
                break;
            }
        }
    }
    else if (toolName == "2LS") {
        std::regex pattern(R"(\[main\]:\s*([A-Za-z]+))", std::regex_constants::icase);
        std::smatch matches;
        for (auto it = lines.rbegin(); it != lines.rend(); it++) {
            if (std::regex_search(*it, matches, pattern)) {
                result = matches[1].str();
                break;
            }
        }
    }
    if (result.empty()) {
        result = "ERROR";
    }

    long long preprocessingTime = -1;
    for (auto it = lines.rbegin(); it != lines.rend(); it++) {
        if (it->find("PreprocessingTime:") != std::string::npos) {
            std::smatch matches;
            if (std::regex_search(*it, matches, std::regex("([0-9]+)"))) {
                preprocessingTime = std::stoll(matches[1].str());
            }
            break;
        }
    }

    long long analysisTime = -1;
    std::string timeKeyword = (toolName == "Athena_BV" || toolName == "Athena_MA" || toolName == "Athena_MI") ? "Runtime:" : "AnalysisTime:";
    for (auto it = lines.rbegin(); it != lines.rend(); it++) {
        if (it->find(timeKeyword) != std::string::npos) {
            std::smatch matches;
            if (std::regex_search(*it, matches, std::regex("([0-9]+)"))) {
                analysisTime = std::stoll(matches[1].str());
            }
            break;
        }
    }

    return {NormalizeVerdict(result), preprocessingTime, analysisTime};
}


std::pair<long long, long long> CountLOCAndTokens(const std::filesystem::path &path) {
    std::ifstream stream(path);
    if (!stream.is_open()) {
        return {-1, -1};
    }
    std::stringstream buffer;
    buffer << stream.rdbuf();
    stream.close();
    const std::string code = buffer.str();
    std::string codeWithoutComments;
    codeWithoutComments.reserve(code.size());
    bool inLineComment = false;
    bool inBlockComment = false;
    bool inString = false;
    bool inChar = false;
    bool escaped = false;
    for (std::size_t i = 0; i < code.size(); i++) {
        char current = code[i];
        char next = (i + 1 < code.size()) ? code[i + 1] : '\0';
        if (inLineComment) {
            if (current == '\n') {
                inLineComment = false;
                codeWithoutComments += '\n';
            }
            continue;
        }
        if (inBlockComment) {
            if (current == '*' && next == '/') {
                inBlockComment = false;
                i++;
            }
            else if (current == '\n') {
                codeWithoutComments += '\n';
            }
            continue;
        }
        if (inString) {
            codeWithoutComments += current;
            if (escaped) {
                escaped = false;
            }
            else if (current == '\\') {
                escaped = true;
            }
            else if (current == '"') {
                inString = false;
            }
            continue;
        }
        if (inChar) {
            codeWithoutComments += current;
            if (escaped) {
                escaped = false;
            }
            else if (current == '\\') {
                escaped = true;
            }
            else if (current == '\'') {
                inChar = false;
            }
            continue;
        }
        if (current == '/' && next == '/') {
            inLineComment = true;
            i++;
            continue;
        }
        if (current == '/' && next == '*') {
            inBlockComment = true;
            i++;
            continue;
        }
        if (current == '"') {
            inString = true;
            codeWithoutComments += current;
            continue;
        }
        if (current == '\'') {
            inChar = true;
            codeWithoutComments += current;
            continue;
        }
        codeWithoutComments += current;
    }
    long long loc = 0;
    std::stringstream lineStream(codeWithoutComments);
    std::string line;
    while (std::getline(lineStream, line)) {
        bool nonEmpty = std::any_of(line.begin(), line.end(), [](unsigned char c) {
            return !std::isspace(c);
        });
        if (nonEmpty) {
            loc++;
        }
    }
    std::regex tokenPattern(
        R"tok("(?:\\.|[^"\\])*"|'(?:\\.|[^'\\])*'|[A-Za-z_][A-Za-z0-9_]*|0[xX][0-9A-Fa-f]+|[0-9]+(?:\.[0-9]+)?(?:[eE][+-]?[0-9]+)?|>>=|<<=|\.\.\.|\+\+|--|->|&&|\|\||<=|>=|==|!=|\+=|-=|\*=|/=|%=|&=|\|=|\^=|<<|>>|##|[{}\[\]();,.?:~!+\-*/%<>=&|^#])tok"
    );
    long long tokens = 0;
    for (std::sregex_iterator it(codeWithoutComments.begin(), codeWithoutComments.end(), tokenPattern);
         it != std::sregex_iterator();
         ++it) {
        tokens++;
    }
    return {loc, tokens};
}


void RecordResults(const std::filesystem::path &excelPath, const std::filesystem::path &sourceCodePath, const std::filesystem::path &resultsDirectory, const std::vector<std::filesystem::path> &variantsToAnalyze, int numLoops, int numNondetInputs, const std::string &toolName, const std::string &benchmarkName, const std::string &configurationFlag, const std::filesystem::path &groundTruthPath) {
    // Excel Column Names
    std::vector<std::string> headers = {
        "Program_Name",
        "Program_NumLoops",
        "Program_NumNondetInputs",
        "Program_Loc",
        "Program_Tokens",
        "Program_GT",

        "Feature_Pointer",
        "Feature_Array",
        "Feature_DataStructure",
        "Feature_BitCalculation",
        "Feature_OverflowUnderflow",
        "Feature_Recursion",

        "Base_Verdict",
        "Base_PreprocessingTime",
        "Base_AnalysisTime",
        "Base_Correctness",
        "Base_T_Solved",
        "Base_T_SolvedRatio",
        "Base_NT_Solved",
        "Base_NT_SolvedRatio",
        "Base_Solved",
        "Base_SolvedRatio",
        "Base_TVT",
        "Base_AVT",
        "Base_MVT",

        "Slice_Name",
        "Slice_LoopID",
        "Slice_TestCaseID",
        "Slice_Loc",
        "Slice_Tokens",
        "Slice_GT",
        "Slice_Verdict",
        "Slice_PreprocessingTime",
        "Slice_AnalysisTime",
        "Slice_Correctness",
        "Slice_T_Solved",
        "Slice_T_SolvedRatio",
        "Slice_NT_Solved",
        "Slice_NT_SolvedRatio",
        "Slice_Solved",
        "Slice_SolvedRatio",
        "Slice_TVT",
        "Slice_AVT",
        "Slice_MVT",

        "Cncrt_Name",
        "Cncrt_LoopID",
        "Cncrt_TestCaseID",
        "Cncrt_Loc",
        "Cncrt_Tokens",
        "Cncrt_GT",
        "Cncrt_Verdict",
        "Cncrt_PreprocessingTime",
        "Cncrt_AnalysisTime",
        "Cncrt_Correctness",
        "Cncrt_T_Solved",
        "Cncrt_T_SolvedRatio",
        "Cncrt_NT_Solved",
        "Cncrt_NT_SolvedRatio",
        "Cncrt_Solved",
        "Cncrt_SolvedRatio",
        "Cncrt_TVT",
        "Cncrt_AVT",
        "Cncrt_MVT",

        "SliceCncrt_Name",
        "SliceCncrt_LoopID",
        "SliceCncrt_TestCaseID",
        "SliceCncrt_Loc",
        "SliceCncrt_Tokens",
        "SliceCncrt_GT",
        "SliceCncrt_Verdict",
        "SliceCncrt_PreprocessingTime",
        "SliceCncrt_AnalysisTime",
        "SliceCncrt_Correctness",
        "SliceCncrt_T_Solved",
        "SliceCncrt_T_SolvedRatio",
        "SliceCncrt_NT_Solved",
        "SliceCncrt_NT_SolvedRatio",
        "SliceCncrt_Solved",
        "SliceCncrt_SolvedRatio",
        "SliceCncrt_TVT",
        "SliceCncrt_AVT",
        "SliceCncrt_MVT",

        "CncrtSlice_Name",
        "CncrtSlice_LoopID",
        "CncrtSlice_TestCaseID",
        "CncrtSlice_Loc",
        "CncrtSlice_Tokens",
        "CncrtSlice_GT",
        "CncrtSlice_Verdict",
        "CncrtSlice_PreprocessingTime",
        "CncrtSlice_AnalysisTime",
        "CncrtSlice_Correctness",
        "CncrtSlice_T_Solved",
        "CncrtSlice_T_SolvedRatio",
        "CncrtSlice_NT_Solved",
        "CncrtSlice_NT_SolvedRatio",
        "CncrtSlice_Solved",
        "CncrtSlice_SolvedRatio",
        "CncrtSlice_TVT",
        "CncrtSlice_AVT",
        "CncrtSlice_MVT",
    };

    // Read Ground Truth
    std::unordered_map<std::string, std::string> groundTruth;
    std::ifstream groundTruthStream(groundTruthPath);
    std::string line;
    while (std::getline(groundTruthStream, line)) {
        if (line.empty()) {
            continue;
        }
        size_t commaPosition = line.find(',');
        if (commaPosition == std::string::npos) {
            continue;
        }
        std::string name = line.substr(0, commaPosition);
        std::string label = line.substr(commaPosition + 1);
        name.erase(name.begin(), std::find_if(name.begin(), name.end(), [](unsigned char c) { return !std::isspace(c); }));
        name.erase(std::find_if(name.rbegin(), name.rend(), [](unsigned char c) { return !std::isspace(c); }).base(), name.end());
        label.erase(label.begin(), std::find_if(label.begin(), label.end(), [](unsigned char c) { return !std::isspace(c); }));
        label.erase(std::find_if(label.rbegin(), label.rend(), [](unsigned char c) { return !std::isspace(c); }).base(), label.end());
        groundTruth[name] = label;
    }
    groundTruthStream.close();

    // Program_Name
    std::string sourceCodeName = sourceCodePath.stem().string();
    std::string sourceCodeExtension = sourceCodePath.extension().string();

    // Program_GT
    std::string programGT;
    auto programGTIterator = groundTruth.find(sourceCodeName);
    if (programGTIterator != groundTruth.end()) {
        programGT = programGTIterator->second;
    }

    // Program_Loc and Program_Tokens
    auto [programLoc, programTokens] = CountLOCAndTokens(sourceCodePath);

    // Open Existing Excel or Create New Excel
    xlnt::workbook wb;
    bool workbookExists = std::filesystem::exists(excelPath);
    bool defaultSheetAvailable = !workbookExists;
    if (workbookExists) {
        wb.load(excelPath.string());
    }

    // Analyzer Sheets
    std::vector<std::pair<std::string, std::string>> analyzerModes;
    if (toolName == "Athena" && benchmarkName == "FSE") {
        analyzerModes.push_back({"Athena_BV", "FSE_Bitvector_Mode_"});
        analyzerModes.push_back({"Athena_MA", "FSE_Modulo_Arithmetic_Mode_"});
        analyzerModes.push_back({"Athena_MI", "FSE_Mathematical_Integer_Mode_"});
    }
    else {
        analyzerModes.push_back({toolName, ""});
    }

    // Record Results for Each Analyzer Sheet
    for (const auto &[analyzerName, resultPrefix] : analyzerModes) {
        // Store Configuration Variant Results
        std::vector<std::string> variantNames;
        std::vector<std::string> variantLoopIDs;
        std::vector<std::string> variantTestCaseIDs;
        std::vector<std::string> variantGTs;
        std::vector<long long> variantLocs;
        std::vector<long long> variantTokens;
        std::vector<std::string> variantVerdicts;
        std::vector<long long> variantPreprocessingTimes;
        std::vector<long long> variantAnalysisTimes;

        // Collect Results for Each Configuration Variant
        for (const std::filesystem::path &variantPath : variantsToAnalyze) {
            std::smatch match;

            // Slice_Name, Cncrt_Name, SliceCncrt_Name, and CncrtSlice_Name
            std::string variantName = variantPath.stem().string();

            // Slice_LoopID, Cncrt_LoopID, SliceCncrt_LoopID, and CncrtSlice_LoopID
            std::string variantLoopID = "0";
            if (std::regex_search(variantName, match, std::regex(R"(_Loop([0-9]+))"))) {
                variantLoopID = match[1].str();
            }

            // Slice_TestCaseID, Cncrt_TestCaseID, SliceCncrt_TestCaseID, and CncrtSlice_TestCaseID
            std::string variantTestCaseID = "0";
            if (std::regex_search(variantName, match, std::regex(R"(_TestCase([0-9]+))"))) {
                variantTestCaseID = match[1].str();
            }

            // Slice_GT, Cncrt_GT, SliceCncrt_GT, and CncrtSlice_GT
            std::string variantGT;
            auto variantGTIterator = groundTruth.find(variantName);
            if (variantGTIterator != groundTruth.end()) {
                variantGT = variantGTIterator->second;
            }

            // Slice_Loc/Slice_Tokens, Cncrt_Loc/Cncrt_Tokens, SliceCncrt_Loc/SliceCncrt_Tokens, and CncrtSlice_Loc/CncrtSlice_Tokens
            auto [variantLoc, variantTokenCount] = CountLOCAndTokens(variantPath);

            // Base_Verdict, Slice_Verdict, Cncrt_Verdict, SliceCncrt_Verdict, and CncrtSlice_Verdict
            // Base_PreprocessingTime, Slice_PreprocessingTime, Cncrt_PreprocessingTime, SliceCncrt_PreprocessingTime, and CncrtSlice_PreprocessingTime
            // Base_AnalysisTime, Slice_AnalysisTime, Cncrt_AnalysisTime, SliceCncrt_AnalysisTime, and CncrtSlice_AnalysisTime
            std::filesystem::path resultPath = resultsDirectory / (resultPrefix + variantName + ".txt");
            auto [variantVerdict, variantPreprocessingTime, variantAnalysisTime] = ReadAnalyzerResult(resultPath, analyzerName);

            // Save Configuration Variant Results
            variantNames.push_back(variantName);
            variantLoopIDs.push_back(variantLoopID);
            variantTestCaseIDs.push_back(variantTestCaseID);
            variantGTs.push_back(variantGT);
            variantVerdicts.push_back(variantVerdict);
            variantLocs.push_back(variantLoc);
            variantTokens.push_back(variantTokenCount);
            variantPreprocessingTimes.push_back(variantPreprocessingTime);
            variantAnalysisTimes.push_back(variantAnalysisTime);
        }

        // Compute Program-Level Evaluation
        bool wrong = false;
        int totalT = 0;
        int solvedT = 0;
        int totalNT = 0;
        int solvedNT = 0;
        for (size_t i = 0; i < variantVerdicts.size(); i++) {
            std::string variantGT = configurationFlag == "base" ? programGT : variantGTs[i];
            if (variantGT == "T") {
                totalT++;
                if (variantVerdicts[i] == "YES") {
                    solvedT++;
                }
                if (variantVerdicts[i] == "NO") {
                    wrong = true;
                }
            }
            else if (variantGT == "NT") {
                totalNT++;
                if (variantVerdicts[i] == "NO") {
                    solvedNT++;
                }
                if (variantVerdicts[i] == "YES") {
                    wrong = true;
                }
            }
        }
        std::string correctness = wrong ? "Wrong" : "Correct";
        std::string tSolved = totalT > 0 ? std::to_string(solvedT) + "/" + std::to_string(totalT) : "0/0";
        std::string ntSolved = totalNT > 0 ? std::to_string(solvedNT) + "/" + std::to_string(totalNT) : "";
        double tSolvedRatio = totalT > 0 ? static_cast<double>(solvedT) / totalT : 0.0;
        double ntSolvedRatio = totalNT > 0 ? static_cast<double>(solvedNT) / totalNT : -1.0;

        // Compute Solved and Solved-Variant Analysis-Time Metrics
        int totalVariants = 0;
        int solvedVariants = 0;
        long long tvt = 0;
        double mvt = 0.0;
        std::vector<long long> solvedVariantAnalysisTimes;
        for (size_t i = 0; i < variantVerdicts.size(); i++) {
            std::string variantGT = configurationFlag == "base" ? programGT : variantGTs[i];
            if (variantGT != "T" && variantGT != "NT") {
                continue;
            }
            totalVariants++;
            bool solved = (variantGT == "T" && variantVerdicts[i] == "YES") || (variantGT == "NT" && variantVerdicts[i] == "NO");
            if (solved) {
                solvedVariants++;
                if (variantAnalysisTimes[i] >= 0) {
                    tvt += variantAnalysisTimes[i];
                    solvedVariantAnalysisTimes.push_back(variantAnalysisTimes[i]);
                }
            }
        }
        std::string solved = totalVariants > 0 ? std::to_string(solvedVariants) + "/" + std::to_string(totalVariants) : "";
        double solvedRatio = totalVariants > 0 ? static_cast<double>(solvedVariants) / totalVariants : -1.0;
        double avt = !solvedVariantAnalysisTimes.empty() ? static_cast<double>(tvt) / solvedVariantAnalysisTimes.size() : 0.0;
        if (!solvedVariantAnalysisTimes.empty()) {
            std::sort(solvedVariantAnalysisTimes.begin(), solvedVariantAnalysisTimes.end());
            size_t middle = solvedVariantAnalysisTimes.size() / 2;
            if (solvedVariantAnalysisTimes.size() % 2 == 0) {
                mvt = (static_cast<double>(solvedVariantAnalysisTimes[middle - 1]) + solvedVariantAnalysisTimes[middle]) / 2.0;
            }
            else {
                mvt = solvedVariantAnalysisTimes[middle];
            }
        }

        // Get or Create Analyzer Sheet
        xlnt::worksheet ws;
        bool newSheet = false;
        if (wb.contains(analyzerName)) {
            ws = wb.sheet_by_title(analyzerName);
        }
        else if (defaultSheetAvailable) {
            ws = wb.active_sheet();
            ws.title(analyzerName);
            defaultSheetAvailable = false;
            newSheet = true;
        }
        else {
            ws = wb.create_sheet();
            ws.title(analyzerName);
            newSheet = true;
        }

        // Create New Analyzer Sheet
        if (newSheet) {
            // Configuration Group Headers
            ws.merge_cells("A1:L1");
            ws.merge_cells("M1:Y1");
            ws.merge_cells("Z1:AR1");
            ws.merge_cells("AS1:BK1");
            ws.merge_cells("BL1:CD1");
            ws.merge_cells("CE1:CW1");

            ws.cell("A1").value("Program");
            ws.cell("M1").value("Base");
            ws.cell("Z1").value("Slice");
            ws.cell("AS1").value("Cncrt");
            ws.cell("BL1").value("SliceCncrt");
            ws.cell("CE1").value("CncrtSlice");

            // Configuration Group Header Font
            xlnt::font groupFont;
            groupFont.bold(true);
            groupFont.size(12);

            // Configuration Group Header Alignment
            xlnt::alignment groupAlignment;
            groupAlignment.horizontal(xlnt::horizontal_alignment::center);
            groupAlignment.vertical(xlnt::vertical_alignment::center);

            ws.cell("A1").font(groupFont);
            ws.cell("M1").font(groupFont);
            ws.cell("Z1").font(groupFont);
            ws.cell("AS1").font(groupFont);
            ws.cell("BL1").font(groupFont);
            ws.cell("CE1").font(groupFont);

            ws.cell("A1").alignment(groupAlignment);
            ws.cell("M1").alignment(groupAlignment);
            ws.cell("Z1").alignment(groupAlignment);
            ws.cell("AS1").alignment(groupAlignment);
            ws.cell("BL1").alignment(groupAlignment);
            ws.cell("CE1").alignment(groupAlignment);

            // Column Header Font
            xlnt::font headerFont;
            headerFont.bold(true);

            // Column Header Alignment
            xlnt::alignment headerAlignment;
            headerAlignment.horizontal(xlnt::horizontal_alignment::center);
            headerAlignment.vertical(xlnt::vertical_alignment::center);
            headerAlignment.wrap(true);

            // Write Excel Column Names
            for (size_t i = 0; i < headers.size(); i++) {
                xlnt::cell_reference headerReference(static_cast<xlnt::column_t>(i + 1), 2);
                ws.cell(headerReference).value(headers[i]);
                ws.cell(headerReference).font(headerFont);
                ws.cell(headerReference).alignment(headerAlignment);
            }

            // Freeze Program Columns and Header Rows
            ws.freeze_panes("G3");

            // Program Column Widths
            ws.column_properties(static_cast<xlnt::column_t>(1)).width = 35.0;
            for (int column = 2; column <= 101; column++) {
                ws.column_properties(static_cast<xlnt::column_t>(column)).width = 20.0;
            }

            // Slice_Name, Cncrt_Name, SliceCncrt_Name, and CncrtSlice_Name Column Widths
            ws.column_properties(static_cast<xlnt::column_t>(26)).width = 40.0;
            ws.column_properties(static_cast<xlnt::column_t>(45)).width = 40.0;
            ws.column_properties(static_cast<xlnt::column_t>(64)).width = 40.0;
            ws.column_properties(static_cast<xlnt::column_t>(83)).width = 40.0;
        }

        // Find Columns for Current Configuration
        int configurationStartColumn = -1;
        int configurationColumnCount = -1;

        // Base = M:Y
        if (configurationFlag == "base") {
            configurationStartColumn = 13;
            configurationColumnCount = 13;
        }

        // Slice = Z:AR
        else if (configurationFlag == "slice") {
            configurationStartColumn = 26;
            configurationColumnCount = 19;
        }

        // Cncrt = AS:BK
        else if (configurationFlag == "cncrt") {
            configurationStartColumn = 45;
            configurationColumnCount = 19;
        }

        // SliceCncrt = BL:CD
        else if (configurationFlag == "slice_cncrt") {
            configurationStartColumn = 64;
            configurationColumnCount = 19;
        }

        // CncrtSlice = CE:CW
        else if (configurationFlag == "cncrt_slice") {
            configurationStartColumn = 83;
            configurationColumnCount = 19;
        }

        // Find Current Program in Analyzer Sheet
        int highestRow = std::max(2, static_cast<int>(ws.highest_row()));
        int programStartRow = -1;
        int nextProgramStartRow = -1;

        // Find First Row of Current Program_Name
        for (int row = 3; row <= highestRow; row++) {
            std::string currentProgramName = ws.cell("A" + std::to_string(row)).to_string();
            if (currentProgramName == sourceCodeName + sourceCodeExtension) {
                programStartRow = row;
                break;
            }
        }

        // Find First Row of Next Program_Name
        if (programStartRow >= 0) {
            for (int row = programStartRow + 1; row <= highestRow; row++) {
                std::string currentProgramName = ws.cell("A" + std::to_string(row)).to_string();
                if (!currentProgramName.empty()) {
                    nextProgramStartRow = row;
                    break;
                }
            }
        }

        // Number of Rows Currently Used by Program
        int existingBlockRows = 0;
        if (programStartRow >= 0) {
            existingBlockRows = nextProgramStartRow >= 0 ? nextProgramStartRow - programStartRow : highestRow - programStartRow + 1;
        }
        else {
            programStartRow = std::max(3, highestRow + 1);
            existingBlockRows = 1;
        }

        // Number of Rows Required by Current Configuration
        int requiredBlockRows = configurationFlag == "base" ? 1 : std::max(1, static_cast<int>(variantNames.size()));

        // Add Rows if Current Configuration Requires More Rows
        if (requiredBlockRows > existingBlockRows && nextProgramStartRow >= 0) {
            ws.insert_rows(static_cast<xlnt::row_t>(nextProgramStartRow), static_cast<std::uint32_t>(requiredBlockRows - existingBlockRows));
            existingBlockRows = requiredBlockRows;
        }
        else if (requiredBlockRows > existingBlockRows) {
            existingBlockRows = requiredBlockRows;
        }

        // Program_Name
        ws.cell("A" + std::to_string(programStartRow)).value(sourceCodeName + sourceCodeExtension);

        // Program_NumLoops
        ws.cell("B" + std::to_string(programStartRow)).value(numLoops);

        // Program_NumNondetInputs
        ws.cell("C" + std::to_string(programStartRow)).value(numNondetInputs);

        // Program_Loc
        if (programLoc >= 0) {
            ws.cell("D" + std::to_string(programStartRow)).value(programLoc);
        }
        else {
            ws.cell("D" + std::to_string(programStartRow)).value("");
        }

        // Program_Tokens
        if (programTokens >= 0) {
            ws.cell("E" + std::to_string(programStartRow)).value(programTokens);
        }
        else {
            ws.cell("E" + std::to_string(programStartRow)).value("");
        }

        // Program_GT
        ws.cell("F" + std::to_string(programStartRow)).value(programGT);

        // Keep Program_* Information Only in First Row of Program Block
        // Feature_* Columns G:L are NOT Changed
        for (int row = programStartRow + 1; row < programStartRow + existingBlockRows; row++) {
            ws.clear_cell(xlnt::cell_reference(static_cast<xlnt::column_t>(1), static_cast<xlnt::row_t>(row)));
            ws.clear_cell(xlnt::cell_reference(static_cast<xlnt::column_t>(2), static_cast<xlnt::row_t>(row)));
            ws.clear_cell(xlnt::cell_reference(static_cast<xlnt::column_t>(3), static_cast<xlnt::row_t>(row)));
            ws.clear_cell(xlnt::cell_reference(static_cast<xlnt::column_t>(4), static_cast<xlnt::row_t>(row)));
            ws.clear_cell(xlnt::cell_reference(static_cast<xlnt::column_t>(5), static_cast<xlnt::row_t>(row)));
            ws.clear_cell(xlnt::cell_reference(static_cast<xlnt::column_t>(6), static_cast<xlnt::row_t>(row)));
        }

        // Clear Previous Results for Current Configuration
        // Feature_* and Other Configuration Columns are NOT Changed
        for (int row = programStartRow; row < programStartRow + existingBlockRows; row++) {
            for (int column = configurationStartColumn; column < configurationStartColumn + configurationColumnCount; column++) {
                ws.clear_cell(xlnt::cell_reference(static_cast<xlnt::column_t>(column), static_cast<xlnt::row_t>(row)));
            }
        }

        // Base
        if (configurationFlag == "base") {
            if (!variantVerdicts.empty()) {
                // Base_Verdict
                ws.cell(xlnt::cell_reference(static_cast<xlnt::column_t>(configurationStartColumn), static_cast<xlnt::row_t>(programStartRow))).value(variantVerdicts[0]);

                // Base_PreprocessingTime
                if (variantPreprocessingTimes[0] >= 0) {
                    ws.cell(xlnt::cell_reference(static_cast<xlnt::column_t>(configurationStartColumn + 1), static_cast<xlnt::row_t>(programStartRow))).value(variantPreprocessingTimes[0]);
                }

                // Base_AnalysisTime
                if (variantAnalysisTimes[0] >= 0) {
                    ws.cell(xlnt::cell_reference(static_cast<xlnt::column_t>(configurationStartColumn + 2), static_cast<xlnt::row_t>(programStartRow))).value(variantAnalysisTimes[0]);
                }
            }

            // Program-Level Evaluation
            ws.cell(xlnt::cell_reference(static_cast<xlnt::column_t>(configurationStartColumn + 3), static_cast<xlnt::row_t>(programStartRow))).value(correctness);
            if (programGT == "T" || programGT == "NT") {
                ws.cell(xlnt::cell_reference(static_cast<xlnt::column_t>(configurationStartColumn + 4), static_cast<xlnt::row_t>(programStartRow))).value(tSolved);
                ws.cell(xlnt::cell_reference(static_cast<xlnt::column_t>(configurationStartColumn + 5), static_cast<xlnt::row_t>(programStartRow))).value(tSolvedRatio);
                ws.cell(xlnt::cell_reference(static_cast<xlnt::column_t>(configurationStartColumn + 5), static_cast<xlnt::row_t>(programStartRow))).number_format(xlnt::number_format("0%"));
            }
            if (programGT == "NT") {
                ws.cell(xlnt::cell_reference(static_cast<xlnt::column_t>(configurationStartColumn + 6), static_cast<xlnt::row_t>(programStartRow))).value(ntSolved);
                ws.cell(xlnt::cell_reference(static_cast<xlnt::column_t>(configurationStartColumn + 7), static_cast<xlnt::row_t>(programStartRow))).value(ntSolvedRatio);
                ws.cell(xlnt::cell_reference(static_cast<xlnt::column_t>(configurationStartColumn + 7), static_cast<xlnt::row_t>(programStartRow))).number_format(xlnt::number_format("0%"));
            }
            if (totalVariants > 0) {
                ws.cell(xlnt::cell_reference(static_cast<xlnt::column_t>(configurationStartColumn + 8), static_cast<xlnt::row_t>(programStartRow))).value(solved);
                ws.cell(xlnt::cell_reference(static_cast<xlnt::column_t>(configurationStartColumn + 9), static_cast<xlnt::row_t>(programStartRow))).value(solvedRatio);
                ws.cell(xlnt::cell_reference(static_cast<xlnt::column_t>(configurationStartColumn + 9), static_cast<xlnt::row_t>(programStartRow))).number_format(xlnt::number_format("0%"));
            }
            ws.cell(xlnt::cell_reference(static_cast<xlnt::column_t>(configurationStartColumn + 10), static_cast<xlnt::row_t>(programStartRow))).value(tvt);
            ws.cell(xlnt::cell_reference(static_cast<xlnt::column_t>(configurationStartColumn + 11), static_cast<xlnt::row_t>(programStartRow))).value(avt);
            ws.cell(xlnt::cell_reference(static_cast<xlnt::column_t>(configurationStartColumn + 12), static_cast<xlnt::row_t>(programStartRow))).value(mvt);
        }

        // Slice, Cncrt, SliceCncrt, and CncrtSlice
        else {
            // Write One Row for Each Configuration Variant
            for (size_t variantIndex = 0; variantIndex < variantNames.size(); variantIndex++) {
                int row = programStartRow + static_cast<int>(variantIndex);

                // Slice_Name, Cncrt_Name, SliceCncrt_Name, and CncrtSlice_Name
                ws.cell(xlnt::cell_reference(static_cast<xlnt::column_t>(configurationStartColumn), static_cast<xlnt::row_t>(row))).value(variantNames[variantIndex] + sourceCodeExtension);

                // Slice_LoopID, Cncrt_LoopID, SliceCncrt_LoopID, and CncrtSlice_LoopID
                ws.cell(xlnt::cell_reference(static_cast<xlnt::column_t>(configurationStartColumn + 1), static_cast<xlnt::row_t>(row))).value(std::stoi(variantLoopIDs[variantIndex]));

                // Slice_TestCaseID, Cncrt_TestCaseID, SliceCncrt_TestCaseID, and CncrtSlice_TestCaseID
                ws.cell(xlnt::cell_reference(static_cast<xlnt::column_t>(configurationStartColumn + 2), static_cast<xlnt::row_t>(row))).value(std::stoi(variantTestCaseIDs[variantIndex]));

                // Slice_Loc, Cncrt_Loc, SliceCncrt_Loc, and CncrtSlice_Loc
                if (variantLocs[variantIndex] >= 0) {
                    ws.cell(xlnt::cell_reference(static_cast<xlnt::column_t>(configurationStartColumn + 3), static_cast<xlnt::row_t>(row))).value(variantLocs[variantIndex]);
                }

                // Slice_Tokens, Cncrt_Tokens, SliceCncrt_Tokens, and CncrtSlice_Tokens
                if (variantTokens[variantIndex] >= 0) {
                    ws.cell(xlnt::cell_reference(static_cast<xlnt::column_t>(configurationStartColumn + 4), static_cast<xlnt::row_t>(row))).value(variantTokens[variantIndex]);
                }

                // Slice_GT, Cncrt_GT, SliceCncrt_GT, and CncrtSlice_GT
                ws.cell(xlnt::cell_reference(static_cast<xlnt::column_t>(configurationStartColumn + 5), static_cast<xlnt::row_t>(row))).value(variantGTs[variantIndex]);

                // Slice_Verdict, Cncrt_Verdict, SliceCncrt_Verdict, and CncrtSlice_Verdict
                ws.cell(xlnt::cell_reference(static_cast<xlnt::column_t>(configurationStartColumn + 6), static_cast<xlnt::row_t>(row))).value(variantVerdicts[variantIndex]);

                // Slice_PreprocessingTime, Cncrt_PreprocessingTime, SliceCncrt_PreprocessingTime, and CncrtSlice_PreprocessingTime
                if (variantPreprocessingTimes[variantIndex] >= 0) {
                    ws.cell(xlnt::cell_reference(static_cast<xlnt::column_t>(configurationStartColumn + 7), static_cast<xlnt::row_t>(row))).value(variantPreprocessingTimes[variantIndex]);
                }

                // Slice_AnalysisTime, Cncrt_AnalysisTime, SliceCncrt_AnalysisTime, and CncrtSlice_AnalysisTime
                if (variantAnalysisTimes[variantIndex] >= 0) {
                    ws.cell(xlnt::cell_reference(static_cast<xlnt::column_t>(configurationStartColumn + 8), static_cast<xlnt::row_t>(row))).value(variantAnalysisTimes[variantIndex]);
                }
            }

            // Program-Level Evaluation
            ws.cell(xlnt::cell_reference(static_cast<xlnt::column_t>(configurationStartColumn + 9), static_cast<xlnt::row_t>(programStartRow))).value(correctness);
            if (programGT == "T" || programGT == "NT") {
                ws.cell(xlnt::cell_reference(static_cast<xlnt::column_t>(configurationStartColumn + 10), static_cast<xlnt::row_t>(programStartRow))).value(tSolved);
                ws.cell(xlnt::cell_reference(static_cast<xlnt::column_t>(configurationStartColumn + 11), static_cast<xlnt::row_t>(programStartRow))).value(tSolvedRatio);
                ws.cell(xlnt::cell_reference(static_cast<xlnt::column_t>(configurationStartColumn + 11), static_cast<xlnt::row_t>(programStartRow))).number_format(xlnt::number_format("0%"));
            }
            if (programGT == "NT") {
                ws.cell(xlnt::cell_reference(static_cast<xlnt::column_t>(configurationStartColumn + 12), static_cast<xlnt::row_t>(programStartRow))).value(ntSolved);
                ws.cell(xlnt::cell_reference(static_cast<xlnt::column_t>(configurationStartColumn + 13), static_cast<xlnt::row_t>(programStartRow))).value(ntSolvedRatio);
                ws.cell(xlnt::cell_reference(static_cast<xlnt::column_t>(configurationStartColumn + 13), static_cast<xlnt::row_t>(programStartRow))).number_format(xlnt::number_format("0%"));
            }
            if (totalVariants > 0) {
                ws.cell(xlnt::cell_reference(static_cast<xlnt::column_t>(configurationStartColumn + 14), static_cast<xlnt::row_t>(programStartRow))).value(solved);
                ws.cell(xlnt::cell_reference(static_cast<xlnt::column_t>(configurationStartColumn + 15), static_cast<xlnt::row_t>(programStartRow))).value(solvedRatio);
                ws.cell(xlnt::cell_reference(static_cast<xlnt::column_t>(configurationStartColumn + 15), static_cast<xlnt::row_t>(programStartRow))).number_format(xlnt::number_format("0%"));
            }
            ws.cell(xlnt::cell_reference(static_cast<xlnt::column_t>(configurationStartColumn + 16), static_cast<xlnt::row_t>(programStartRow))).value(tvt);
            ws.cell(xlnt::cell_reference(static_cast<xlnt::column_t>(configurationStartColumn + 17), static_cast<xlnt::row_t>(programStartRow))).value(avt);
            ws.cell(xlnt::cell_reference(static_cast<xlnt::column_t>(configurationStartColumn + 18), static_cast<xlnt::row_t>(programStartRow))).value(mvt);
        }
    }

    // Save Excel
    wb.save(excelPath.string());

    std::cout << "Results written to: " << excelPath << std::endl;
}