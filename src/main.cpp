#include <regex>
#include <thread>
#include <string>
#include <csignal>
#include <fstream>
#include <sstream>
#include <unistd.h>
#include <sys/wait.h>

#include "clang/Tooling/Tooling.h"

#include "../include/file/info.h"
#include "../include/nondet_extractor/action.h"
#include "../include/input_generator/input_generator.h"
#include "../include/slicer/action.h"
#include "../include/slicer/fix_framac_bugs.h"
#include "../include/slicer/merge_sliced_program.h"
#include "../include/concretizer/action.h"
#include "../include/result_recorder/result_recorder.h"

int runAnalyzer(int argc, char *argv[]);
int runInputGenerator(int argc, char *argv[]);
std::vector<std::filesystem::path> runSlicer(const std::vector<std::filesystem::path> &inputProgramsDirectory, const std::filesystem::path &slicedVariantsDirectory, const std::filesystem::path &toolDirectory, const std::filesystem::path &workingDirectory);
std::vector<std::filesystem::path> runConcretizer(const std::vector<std::filesystem::path> &inputProgramsDirectory, const std::filesystem::path &testCasesPath, const std::filesystem::path &concretizedVariantsDirectory);
void analyzeVariant(const std::filesystem::path &inputProgramPath, const std::string &toolName, const std::string &benchmarkName, const std::string &timeout, const std::filesystem::path &resultsDirectory, const std::filesystem::path &toolDirectory, const std::filesystem::path &workingDirectory);

int main(int argc, char *argv[]) {
    if (argc >= 2 && std::string(argv[1]) == "--input-generation") {
        return runInputGenerator(argc, argv);
    }
    if (argc >= 2 && std::string(argv[1]) == "--analysis") {
        return runAnalyzer(argc, argv);
    }
    std::cerr << "Usage:" << std::endl;
    std::cerr << "  ./FocusTNT --analysis <path/to/source_code.c> <path/to/test_cases.csv> <path/to/ground_truth.csv> --tool=<Athena|PROTON|UAutomizer|AProVE|CPAchecker|2LS> --benchmark=<TermCOMP|FSE> --configuration=<base|slice|cncrt|slice_cncrt|cncrt_slice> --timeout=<seconds>\n";
    std::cerr << "  ./FocusTNT --input-generation <path/to/source_code.c> --model=<gpt-5.6-terra|gpt-oss-20b> --temperature=<0.0-2.0> --reasoning-effort=<low|medium|high> --max-attempts=<number> --num-inputs=<number> --execution-timeout=<seconds>\n";
    return 1;
}

int runAnalyzer(int argc, char *argv[]) {
    if (argc < 9) {
        std::cerr << "Usage:\n" << " ./FocusTNT --analysis <path/to/source_code.c> <path/to/test_cases.csv> <path/to/ground_truth.csv> --tool=<Athena|PROTON|UAutomizer|AProVE|CPAchecker|2LS> --benchmark=<TermCOMP|FSE> --configuration=<base|slice|cncrt|slice_cncrt|cncrt_slice> --timeout=<seconds>\n";
        return 1;
    }

    std::filesystem::path toolPath = std::filesystem::canonical(argv[0]);
    std::filesystem::path toolDirectory = toolPath.parent_path();

    std::filesystem::path sourceCodePath = std::filesystem::canonical(argv[2]);
    std::ifstream sourceCodeStream(sourceCodePath);
    if (!sourceCodeStream) {
        std::cerr << strerror(errno) << ": " << sourceCodePath << std::endl;
        return 1;
    }
    std::stringstream sourceCodeBuffer;
    sourceCodeBuffer << sourceCodeStream.rdbuf();
    std::string sourceCodeFile = sourceCodeBuffer.str();
    sourceCodeStream.close();

    std::filesystem::path testCasesPath = std::filesystem::canonical(argv[3]);
    std::ifstream testCasesStream(testCasesPath);
    if (!testCasesStream) {
        std::cerr << strerror(errno) << ": " << testCasesPath << std::endl;
        return 1;
    }

    std::filesystem::path groundTruthPath = std::filesystem::canonical(argv[4]);
    std::ifstream groundTruthStream(groundTruthPath);
    if (!groundTruthStream) {
        std::cerr << strerror(errno) << ": " << groundTruthPath << std::endl;
        return 1;
    }
    groundTruthStream.close();

    std::string toolName = argv[5];
    toolName.erase(toolName.find("--tool="), std::string("--tool=").length());

    std::string benchmarkName = argv[6];
    benchmarkName.erase(benchmarkName.find("--benchmark="), std::string("--benchmark=").length());

    std::string configurationFlag = argv[7];
    configurationFlag.erase(configurationFlag.find("--configuration="), std::string("--configuration=").length());

    std::string timeout = argv[8];
    timeout.erase(timeout.find("--timeout="), std::string("--timeout=").length());

    sourceCodeName = sourceCodePath.stem().string();
    sourceCodeExtension = sourceCodePath.extension().string();
    sourceCodeDirectory = sourceCodePath.parent_path();

    std::filesystem::path analyzerArtifactsDirectory = sourceCodeDirectory / "analyzer_artifacts";
    std::filesystem::path slicedVariantsDirectory = analyzerArtifactsDirectory / "sliced_variants";
    std::filesystem::path concretizedVariantsDirectory = analyzerArtifactsDirectory / "concretized_variants";
    std::filesystem::path resultsDirectory = analyzerArtifactsDirectory / "results";

    std::error_code ec;
    std::filesystem::remove_all(slicedVariantsDirectory, ec);
    ec.clear();
    std::filesystem::remove_all(concretizedVariantsDirectory, ec);
    ec.clear();
    std::filesystem::remove_all(resultsDirectory, ec);
    ec.clear();
    std::filesystem::create_directories(slicedVariantsDirectory);
    std::filesystem::create_directories(concretizedVariantsDirectory);
    std::filesystem::create_directories(resultsDirectory);

    std::vector<std::filesystem::path> variantsToAnalyze;
    auto preprocessingTime_start = std::chrono::steady_clock::now();

    if (configurationFlag == "base") {
        variantsToAnalyze = {sourceCodePath};
    }
    else if (configurationFlag == "slice") {
        variantsToAnalyze = runSlicer({sourceCodePath}, slicedVariantsDirectory, toolDirectory, sourceCodeDirectory);
    }
    else if (configurationFlag == "cncrt") {
        variantsToAnalyze = runConcretizer({sourceCodePath}, testCasesPath, concretizedVariantsDirectory);
    }
    else if (configurationFlag == "slice_cncrt") {
        std::vector<std::filesystem::path> slicedPrograms = runSlicer({sourceCodePath}, slicedVariantsDirectory, toolDirectory, sourceCodeDirectory);
        variantsToAnalyze = runConcretizer(slicedPrograms, testCasesPath, concretizedVariantsDirectory);
    }
    else if (configurationFlag == "cncrt_slice") {
        std::vector<std::filesystem::path> concretizedPrograms = runConcretizer({sourceCodePath}, testCasesPath, concretizedVariantsDirectory);
        variantsToAnalyze = runSlicer(concretizedPrograms, slicedVariantsDirectory, toolDirectory, sourceCodeDirectory);
    }

    auto preprocessingTime_end = std::chrono::steady_clock::now();
    long long preprocessingTime_total = configurationFlag == "base" ? 0 : std::chrono::duration_cast<std::chrono::milliseconds>(preprocessingTime_end - preprocessingTime_start).count();
    long long preprocessingTime_base = variantsToAnalyze.empty() ? 0 : preprocessingTime_total / static_cast<long long>(variantsToAnalyze.size());
    long long preprocessingTime_remainder = variantsToAnalyze.empty() ? 0 : preprocessingTime_total % static_cast<long long>(variantsToAnalyze.size());

    auto appendPreprocessingTime = [&](const std::filesystem::path &resultPath, long long preprocessingTime) {
        std::ofstream(resultPath, std::ios::app) << "PreprocessingTime: " << preprocessingTime << " milliseconds" << std::endl;
    };

    for (size_t variantIndex = 0; variantIndex < variantsToAnalyze.size(); variantIndex++) {
        const std::filesystem::path &variant = variantsToAnalyze[variantIndex];
        analyzeVariant(variant, toolName, benchmarkName, timeout, resultsDirectory, toolDirectory, sourceCodeDirectory);

        long long preprocessingTime_perVariant = preprocessingTime_base + (static_cast<long long>(variantIndex) < preprocessingTime_remainder ? 1 : 0);
        std::string variantName = variant.stem().string();
        if (toolName == "Athena" && benchmarkName == "FSE") {
            appendPreprocessingTime(resultsDirectory / ("FSE_Bitvector_Mode_" + variantName + ".txt"), preprocessingTime_perVariant);
            appendPreprocessingTime(resultsDirectory / ("FSE_Modulo_Arithmetic_Mode_" + variantName + ".txt"), preprocessingTime_perVariant);
            appendPreprocessingTime(resultsDirectory / ("FSE_Mathematical_Integer_Mode_" + variantName + ".txt"), preprocessingTime_perVariant);
        }
        else {
            appendPreprocessingTime(resultsDirectory / (variantName + ".txt"), preprocessingTime_perVariant);
        }

        std::this_thread::sleep_for(std::chrono::seconds(5));
    }

    std::filesystem::path excelPath = toolDirectory.parent_path() / (benchmarkName + " - Evaluation Results.xlsx");

    std::vector<LoopDescriptor> loops;
    clang::tooling::runToolOnCode(std::make_unique<slicer::Action>(loops), sourceCodeFile);
    int numLoops = static_cast<int>(loops.size());

    int numNondetInputs = 0;
    std::string testCasesHeader;
    if (std::getline(testCasesStream, testCasesHeader)) {
        bool insideQuotes = false;
        int numColumns = 1;
        for (char c : testCasesHeader) {
            if (c == '"') {
                insideQuotes = !insideQuotes;
            }
            else if (c == ',' && !insideQuotes) {
                numColumns++;
            }
        }
        numNondetInputs = numColumns - 1;
    }
    testCasesStream.close();

    RecordResults(excelPath, sourceCodePath, resultsDirectory, variantsToAnalyze, numLoops, numNondetInputs, toolName, benchmarkName, configurationFlag, groundTruthPath);

    return 0;
}

int runInputGenerator(int argc, char *argv[]) {
    if (argc < 9) {
        std::cerr << "Usage: ./FocusTNT --input-generation <path/to/source_code.c> --model=<gpt-5.6-terra|gpt-oss-20b> --temperature=<0.0-2.0> --reasoning-effort=<low|medium|high> --max-attempts=<number> --num-inputs=<number> --execution-timeout=<seconds>\n";
        return 1;
    }

    std::filesystem::path sourceCodePath = std::filesystem::canonical(argv[2]);
    std::ifstream sourceCodeStream(sourceCodePath);
    if (!sourceCodeStream) {
        std::cerr << strerror(errno) << ": " << sourceCodePath << std::endl;
        return 1;
    }
    std::stringstream sourceCodeBuffer;
    sourceCodeBuffer << sourceCodeStream.rdbuf();
    std::string sourceCodeFile = sourceCodeBuffer.str();

    std::string model = argv[3];
    model.erase(model.find("--model="), std::string("--model=").length());

    std::string temperature = argv[4];
    temperature.erase(temperature.find("--temperature="), std::string("--temperature=").length());

    std::string reasoningEffort = argv[5];
    reasoningEffort.erase(reasoningEffort.find("--reasoning-effort="), std::string("--reasoning-effort=").length());

    std::string maxAttemptsStr = argv[6];
    maxAttemptsStr.erase(maxAttemptsStr.find("--max-attempts="), std::string("--max-attempts=").length());
    int maxAttempts = std::stoi(maxAttemptsStr);

    std::string numInputsStr = argv[7];
    numInputsStr.erase(numInputsStr.find("--num-inputs="), std::string("--num-inputs=").length());
    int numInputs = std::stoi(numInputsStr);

    std::string timeoutStr = argv[8];
    timeoutStr.erase(timeoutStr.find("--execution-timeout="), std::string("--execution-timeout=").length());
    int timeout = std::stoi(timeoutStr);

    sourceCodeName = sourceCodePath.stem().string();
    sourceCodeExtension = sourceCodePath.extension().string();
    sourceCodeDirectory = sourceCodePath.parent_path();

    std::filesystem::path inputGeneratorArtifactsDirectory = sourceCodeDirectory / "input_generator_artifacts";
    std::filesystem::path generatedProgramsDirectory = inputGeneratorArtifactsDirectory / "generated_programs";
    std::filesystem::path generationHistoryPath = inputGeneratorArtifactsDirectory / "generation_history.csv";
    std::filesystem::path generationConfigurationPath = inputGeneratorArtifactsDirectory / "generation_configuration.txt";
    std::filesystem::path testCasesPath = sourceCodeDirectory / "test_cases.csv";

    std::error_code ec;
    std::filesystem::remove_all(generatedProgramsDirectory, ec);
    std::filesystem::create_directories(generatedProgramsDirectory);

    std::string header = "#include \"stdlib.h\"\n";
    if (sourceCodeFile.find(header) == std::string::npos) {
        sourceCodeFile = header + sourceCodeFile;
    }

    std::string sourceCodeClass;
    if (sourceCodeName.ends_with("_NT")) {
        sourceCodeClass = "NT";
    }
    else if (sourceCodeName.ends_with("_T")) {
        sourceCodeClass = "T";
    }
    else {
        std::cout << "Source code file name must end with _T or _NT.\n";
        return 1;
    }

    if (numInputs <= 0 || (sourceCodeClass == "NT" && numInputs % 2 != 0)) {
        std::cout << "--num-inputs must be greater than 0 and must be even for NT programs.\n";
        return 1;
    }

    int requiredT;
    int requiredNT;
    if (sourceCodeClass == "T") {
        requiredT = numInputs;
        requiredNT = 0;
    }
    else {
        requiredT = numInputs / 2;
        requiredNT = numInputs / 2;
    }

    std::ofstream testCasesStream(testCasesPath, std::ios::trunc);

    std::vector<NondetInput> inputs;
    clang::tooling::runToolOnCode(std::make_unique<nondet_extractor::Action>(inputs), sourceCodeFile);
    if (inputs.empty()) {
        std::cout << "No __VERIFIER_nondet_* inputs were found.\n";
        return 1;
    }

    std::ofstream generationConfigurationStream(generationConfigurationPath, std::ios::trunc);
    generationConfigurationStream << "Model=" << model << "\n";
    generationConfigurationStream << "Temperature=" << temperature << "\n";
    generationConfigurationStream << "ReasoningEffort=" << reasoningEffort << "\n";
    generationConfigurationStream << "Timeout=" << timeout << "\n";
    generationConfigurationStream << "MaxAttempts=" << maxAttempts << "\n";
    int maxAttemptsT = sourceCodeClass == "T" ? maxAttempts : maxAttempts / 2;
    int maxAttemptsNT = sourceCodeClass == "NT" ? maxAttempts - maxAttemptsT : 0;
    generationConfigurationStream << "ProgramClass=" << sourceCodeClass << "\n";
    generationConfigurationStream << "RequestedInputs=" << numInputs << "\n";
    generationConfigurationStream << "RequiredT=" << requiredT << "\n";
    generationConfigurationStream << "RequiredNT=" << requiredNT << "\n";
    generationConfigurationStream.close();

    std::ofstream generationHistoryStream(generationHistoryPath, std::ios::trunc);
    generationHistoryStream << "Candidate,Target,Assignments,ProgramPath,ExecutionResult,Label,Accepted\n";

    GenerationConfiguration generationConfiguration;
    generationConfiguration.model = model;
    generationConfiguration.temperature = std::stod(temperature);
    generationConfiguration.reasoningEffort = reasoningEffort;

    InputGenerator inputGenerator(generationConfiguration);

    int acceptedT = 0;
    int acceptedLikelyNT = 0;
    int candidateIndex = 0;

    int attemptsT = 0;
    int attemptsNT = 0;

    std::vector<std::string> seenAssignmentKeys;
    std::vector<std::vector<NondetAssignment>> previousAssignments;
    std::vector<std::pair<std::vector<NondetAssignment>, std::string>> acceptedAssignments;

    auto csvEscape = [](const std::string &value) {
        if (value.find(',') == std::string::npos && value.find('"') == std::string::npos && value.find('\n') == std::string::npos) {
            return value;
        }
        std::string escaped = "\"";
        for (char c : value) {
            if (c == '"') {
                escaped += "\"\"";
            }
            else {
                escaped += c;
            }
        }
        escaped += "\"";
        return escaped;
    };

    while (acceptedT < requiredT && attemptsT < maxAttemptsT) {
        ++attemptsT;
        ++candidateIndex;

        GenerationTarget generationTarget = GenerationTarget::Terminating;

        std::cout << "Generating candidate " << candidateIndex << " for target T..." << std::endl;

        std::vector<NondetAssignment> assignments;
        try {
            assignments = inputGenerator.Generate(sourceCodePath.string(), inputs, generationTarget, previousAssignments);
        }
        catch (const std::exception &ex) {
            generationHistoryStream << candidateIndex << ",T," << csvEscape(ex.what()) << ",,GENERATION_ERROR,,false\n";
            generationHistoryStream.flush();
            continue;
        }

        std::ostringstream assignmentKeyStream;
        for (const auto &assignment : assignments) {
            assignmentKeyStream << assignment.id << "=" << assignment.value << "\n";
        }

        std::string assignmentKey = assignmentKeyStream.str();
        if (std::find(seenAssignmentKeys.begin(), seenAssignmentKeys.end(), assignmentKey) != seenAssignmentKeys.end()) {
            generationHistoryStream << candidateIndex << ",T," << csvEscape(assignmentKey) << ",,DUPLICATE,,false\n";
            generationHistoryStream.flush();
            continue;
        }

        seenAssignmentKeys.push_back(assignmentKey);
        previousAssignments.push_back(assignments);

        std::string assignmentIndex = std::to_string(candidateIndex);
        clang::tooling::runToolOnCode(std::make_unique<concretizer::Action>(assignments, assignmentIndex), sourceCodeFile);
        std::filesystem::path generatedCandidatePath = sourceCodeDirectory / (sourceCodeName + "_TestCase" + assignmentIndex + sourceCodeExtension);
        std::filesystem::path candidatePath = generatedProgramsDirectory / (sourceCodeName + "_TestCase" + assignmentIndex + sourceCodeExtension);
        std::filesystem::rename(generatedCandidatePath, candidatePath);

        std::filesystem::path executablePath = generatedProgramsDirectory / (sourceCodeName + "_TestCase" + std::to_string(candidateIndex) + "_executable");
        std::string compiler = (sourceCodeExtension == ".cpp" || sourceCodeExtension == ".cc" || sourceCodeExtension == ".cxx") ? "clang++" : "clang";
        std::string command = compiler + " \"" + candidatePath.string() + "\" -O0 -o \"" + executablePath.string() + "\"";
        int result = system(command.c_str());
        if (result != 0 || !std::filesystem::exists(executablePath)) {
            std::error_code removeCandidateError;
            std::filesystem::remove(candidatePath, removeCandidateError);
            generationHistoryStream << candidateIndex << ",T," << csvEscape(assignmentKey) << ",,COMPILE_ERROR,,false\n";
            generationHistoryStream.flush();
            continue;
        }

        bool terminated = false;
        bool timedOut = false;
        bool runtimeError = false;
        pid_t pid = fork();
        if (pid < 0) {
            throw std::runtime_error("fork() failed.");
        }
        if (pid == 0) {
            execl(executablePath.c_str(), executablePath.c_str(), static_cast<char *>(nullptr));
            _exit(127);
        }
        auto deadline = std::chrono::steady_clock::now() + std::chrono::seconds(timeout);
        int status = 0;
        while (true) {
            pid_t waitResult = waitpid(pid, &status, WNOHANG);
            if (waitResult == pid) {
                if (WIFEXITED(status) && WEXITSTATUS(status) == 0) {
                    terminated = true;
                }
                else {
                    runtimeError = true;
                }
                break;
            }
            if (waitResult < 0) {
                runtimeError = true;
                break;
            }
            if (std::chrono::steady_clock::now() >= deadline) {
                kill(pid, SIGKILL);
                waitpid(pid, &status, 0);
                timedOut = true;
                break;
            }
            std::this_thread::sleep_for(std::chrono::milliseconds(100));
        }
        std::error_code removeExecutableError;
        std::filesystem::remove(executablePath, removeExecutableError);
        std::string executionResult;
        if (terminated) {
            executionResult = "COMPLETED";
        }
        else if (timedOut) {
            executionResult = "TIMEOUT";
        }
        else {
            executionResult = "RUNTIME_ERROR";
        }

        std::string label;
        bool accepted = false;
        if (terminated) {
            label = "T";
            accepted = true;
            ++acceptedT;
            acceptedAssignments.push_back({assignments, "T"});
        }
        else if (timedOut) {
            label = "LIKELY_NT";
        }
        std::string programPath;
        if (accepted) {
            programPath = candidatePath.string();
        }
        else {
            std::error_code removeCandidateError;
            std::filesystem::remove(candidatePath, removeCandidateError);
        }

        generationHistoryStream << candidateIndex << ",T," << csvEscape(assignmentKey) << "," << csvEscape(programPath) << "," << executionResult << "," << label << "," << (accepted ? "true" : "false") << "\n";
        generationHistoryStream.flush();
    }

    while (acceptedLikelyNT < requiredNT && attemptsNT < maxAttemptsNT) {
        ++attemptsNT;
        ++candidateIndex;

        GenerationTarget generationTarget = GenerationTarget::NonTerminating;

        std::cout << "Generating candidate " << candidateIndex << " for target NT..." << std::endl;

        std::vector<NondetAssignment> assignments;
        try {
            assignments = inputGenerator.Generate(sourceCodePath.string(), inputs, generationTarget, previousAssignments);
        }
        catch (const std::exception &ex) {
            generationHistoryStream << candidateIndex << ",NT," << csvEscape(ex.what()) << ",,GENERATION_ERROR,,false\n";
            generationHistoryStream.flush();
            continue;
        }

        std::ostringstream assignmentKeyStream;
        for (const auto &assignment : assignments) {
            assignmentKeyStream << assignment.id << "=" << assignment.value << "\n";
        }

        std::string assignmentKey = assignmentKeyStream.str();
        if (std::find(seenAssignmentKeys.begin(), seenAssignmentKeys.end(), assignmentKey) != seenAssignmentKeys.end()) {
            generationHistoryStream << candidateIndex << ",NT," << csvEscape(assignmentKey) << ",,DUPLICATE,,false\n";
            generationHistoryStream.flush();
            continue;
        }

        seenAssignmentKeys.push_back(assignmentKey);
        previousAssignments.push_back(assignments);

        std::string assignmentIndex = std::to_string(candidateIndex);
        clang::tooling::runToolOnCode(std::make_unique<concretizer::Action>(assignments, assignmentIndex), sourceCodeFile);
        std::filesystem::path generatedCandidatePath = sourceCodeDirectory / (sourceCodeName + "_TestCase" + assignmentIndex + sourceCodeExtension);
        std::filesystem::path candidatePath = generatedProgramsDirectory / (sourceCodeName + "_TestCase" + assignmentIndex + sourceCodeExtension);
        std::filesystem::rename(generatedCandidatePath, candidatePath);

        std::filesystem::path executablePath = generatedProgramsDirectory / (sourceCodeName + "_TestCase" + std::to_string(candidateIndex) + "_executable");
        std::string compiler = (sourceCodeExtension == ".cpp" || sourceCodeExtension == ".cc" || sourceCodeExtension == ".cxx") ? "clang++" : "clang";
        std::string command = compiler + " \"" + candidatePath.string() + "\" -O0 -o \"" + executablePath.string() + "\"";
        int result = system(command.c_str());
        if (result != 0 || !std::filesystem::exists(executablePath)) {
            std::error_code removeCandidateError;
            std::filesystem::remove(candidatePath, removeCandidateError);
            generationHistoryStream << candidateIndex << ",NT," << csvEscape(assignmentKey) << ",,COMPILE_ERROR,,false\n";
            generationHistoryStream.flush();
            continue;
        }

        bool terminated = false;
        bool timedOut = false;
        bool runtimeError = false;
        pid_t pid = fork();
        if (pid < 0) {
            throw std::runtime_error("fork() failed.");
        }
        if (pid == 0) {
            execl(executablePath.c_str(), executablePath.c_str(), static_cast<char *>(nullptr));
            _exit(127);
        }
        auto deadline = std::chrono::steady_clock::now() + std::chrono::seconds(timeout);
        int status = 0;
        while (true) {
            pid_t waitResult = waitpid(pid, &status, WNOHANG);
            if (waitResult == pid) {
                if (WIFEXITED(status) && WEXITSTATUS(status) == 0) {
                    terminated = true;
                }
                else {
                    runtimeError = true;
                }
                break;
            }
            if (waitResult < 0) {
                runtimeError = true;
                break;
            }
            if (std::chrono::steady_clock::now() >= deadline) {
                kill(pid, SIGKILL);
                waitpid(pid, &status, 0);
                timedOut = true;
                break;
            }

            std::this_thread::sleep_for(std::chrono::milliseconds(100));
        }
        std::error_code removeExecutableError;
        std::filesystem::remove(executablePath, removeExecutableError);
        std::string executionResult;
        if (terminated) {
            executionResult = "COMPLETED";
        }
        else if (timedOut) {
            executionResult = "TIMEOUT";
        }
        else {
            executionResult = "RUNTIME_ERROR";
        }

        std::string label;
        bool accepted = false;
        if (terminated) {
            label = "T";
        }
        else if (timedOut) {
            label = "LIKELY_NT";
            accepted = true;
            ++acceptedLikelyNT;
            acceptedAssignments.push_back({assignments, "LIKELY_NT"});
        }
        std::string programPath;
        if (accepted) {
            programPath = candidatePath.string();
        }
        else {
            std::error_code removeCandidateError;
            std::filesystem::remove(candidatePath, removeCandidateError);
        }

        generationHistoryStream << candidateIndex << ",NT," << csvEscape(assignmentKey) << "," << csvEscape(programPath) << "," << executionResult << "," << label << "," << (accepted ? "true" : "false") << "\n";
        generationHistoryStream.flush();
    }

    if (acceptedT < requiredT || acceptedLikelyNT < requiredNT) {
        std::cout << "Generated " << acceptedT << "/" << requiredT << " terminating inputs and " << acceptedLikelyNT << "/" << requiredNT << " non-terminating inputs.\n";
    }

    for (std::size_t i = 0; i < inputs.size(); ++i) {
        if (i > 0) {
            testCasesStream << ",";
        }
        testCasesStream << csvEscape(inputs[i].id);
    }
    testCasesStream << ",Label\n";
    for (const auto &[assignments, label] : acceptedAssignments) {
        for (std::size_t i = 0; i < inputs.size(); ++i) {
            if (i > 0) {
                testCasesStream << ",";
            }
            bool found = false;
            std::string value;
            for (const auto &assignment : assignments) {
                if (assignment.id == inputs[i].id) {
                    value = assignment.value;
                    found = true;
                    break;
                }
            }
            if (!found) {
                throw std::runtime_error("Missing assignment for ID: " + inputs[i].id);
            }
            testCasesStream << csvEscape(value);
        }
        testCasesStream << "," << label << "\n";
    }

    std::cout << "Input generation completed.\n";
    std::cout << "Test cases: " << testCasesPath << "\n";
    std::cout << "Generation history: " << generationHistoryPath << "\n";
    std::cout << "Generation configuration: " << generationConfigurationPath << "\n";
    std::cout << "Generated programs: " << generatedProgramsDirectory << std::endl;

    return 0;
}

std::vector<std::filesystem::path> runSlicer(const std::vector<std::filesystem::path> &inputProgramsDirectory, const std::filesystem::path &slicedVariantsDirectory, const std::filesystem::path &toolDirectory, const std::filesystem::path &workingDirectory) {
    std::vector<std::filesystem::path> slicedVariants;

    std::string header = "#include \"stdlib.h\"\n";

    for (const std::filesystem::path &inputProgramPath : inputProgramsDirectory) {
        std::vector<LoopDescriptor> loops;

        std::string inputProgramName = inputProgramPath.stem().string();
        std::string inputProgramExtension = inputProgramPath.extension().string();
        std::string inputProgramRelativePath = std::filesystem::relative(inputProgramPath, workingDirectory).generic_string();

        std::ifstream inputProgramInStream(inputProgramPath);
        std::stringstream inputProgramBuffer;
        inputProgramBuffer << inputProgramInStream.rdbuf();
        std::string inputProgramFile = inputProgramBuffer.str();
        inputProgramInStream.close();

        if (inputProgramFile.find(header) == std::string::npos) {
            inputProgramFile = header + inputProgramFile;
            std::ofstream inputProgramOutStream(inputProgramPath);
            inputProgramOutStream << inputProgramFile;
            inputProgramOutStream.close();
        }

        clang::tooling::runToolOnCode(std::make_unique<slicer::Action>(loops), inputProgramFile);

        if (loops.empty() || inputProgramName.starts_with("Incorrect_Return_")) {
            std::filesystem::path slicedVariantPath = slicedVariantsDirectory / (inputProgramName + "_Loop0" + inputProgramExtension);
            std::filesystem::copy_file(inputProgramPath, slicedVariantPath, std::filesystem::copy_options::overwrite_existing);
            slicedVariants.push_back(slicedVariantPath);
            continue;
        }

        for (auto &loop : loops) {
            std::cout << "Generating sliced variant for " << inputProgramName << ", loop at line " << loop.lineNumber << "..." << std::endl;

            std::string slicingCriterion = "";
            if (!loop.conditionVariables.empty()) {
                slicingCriterion += "\"-slice-rd=";
                int counter = 1;
                for (auto &conditionVariable : loop.conditionVariables) {
                    if (counter > 1) slicingCriterion += ", ";
                    slicingCriterion += conditionVariable;
                    counter++;
                }
                slicingCriterion += "\" ";
            }
            if (loop.hasEarlyExits) {
                slicingCriterion += "-slice-annot " + loop.functionName + " ";
            }

            if (loop.functionName == "main") {
                std::filesystem::path slicedVariantPath = slicedVariantsDirectory / (inputProgramName + "_Loop" + loop.lineNumber + inputProgramExtension);
                std::string slicedVariantRelativePath = std::filesystem::relative(slicedVariantPath, workingDirectory).generic_string();

                std::string command_FramaC = "docker run --rm --platform linux/amd64 -v " + toolDirectory.parent_path().string() + "/tools:/TOOL_DIR -v " + workingDirectory.string() + ":/FILES_DIR framac/frama-c-gui:dev bash -c '"
                                             "frama-c -load-plugin slicing -eva -quiet "
                                             "-main main "
                                             + slicingCriterion +
                                             "-slicing-level 3 -slicing-keep-annotations "
                                             "/FILES_DIR/" + inputProgramRelativePath + " "
                                             "-then-on \"Slicing export\" -print | awk \"/\\/\\* Generated by Frama-C \\*/ {found=1} found\" > /FILES_DIR/" + slicedVariantRelativePath + "'";
                int result_FramaC = system(command_FramaC.c_str());
                if (result_FramaC != 0) {
                    std::cerr << "Frama-C execution failed for " << inputProgramName << ", loop " << loop.lineNumber << "." << std::endl;
                    continue;
                }
                fixFramacBugs(inputProgramName, slicedVariantPath.string());

                slicedVariants.push_back(slicedVariantPath);
            }

            else {
                std::filesystem::path slicedVariant1Path = slicedVariantsDirectory / (inputProgramName + "_Loop" + loop.lineNumber + "_v1" + inputProgramExtension);
                std::string slicedVariant1RelativePath = std::filesystem::relative(slicedVariant1Path, workingDirectory).generic_string();

                std::filesystem::path slicedVariant2Path = slicedVariantsDirectory / (inputProgramName + "_Loop" + loop.lineNumber + "_v2" + inputProgramExtension);
                std::string slicedVariant2RelativePath = std::filesystem::relative(slicedVariant2Path, workingDirectory).generic_string();

                std::filesystem::path mergedSlicedVariantPath = slicedVariantsDirectory / (inputProgramName + "_Loop" + loop.lineNumber + inputProgramExtension);

                std::string command1_FramaC = "docker run --rm --platform linux/amd64 -v " + toolDirectory.parent_path().string() + "/tools:/TOOL_DIR -v " + workingDirectory.string() + ":/FILES_DIR framac/frama-c-gui:dev bash -c '"
                                              "frama-c -load-plugin slicing -eva -quiet "
                                              "-main " + loop.functionName + " "
                                              + slicingCriterion +
                                              "-slice-return " + loop.functionName + " "
                                              "-slicing-level 3 -slicing-keep-annotations "
                                              "/FILES_DIR/" + inputProgramRelativePath + " "
                                              "-then-on \"Slicing export\" -print | awk \"/\\/\\* Generated by Frama-C \\*/ {found=1} found\" > /FILES_DIR/" + slicedVariant1RelativePath + "'";
                int result1_FramaC = system(command1_FramaC.c_str());
                if (result1_FramaC != 0) {
                    std::cerr << "Frama-C execution failed for first slice of " << inputProgramName << ", loop " << loop.lineNumber << "." << std::endl;
                    continue;
                }
                fixFramacBugs(inputProgramName, slicedVariant1Path.string());

                std::string command2_FramaC = "docker run --rm --platform linux/amd64 -v " + toolDirectory.parent_path().string() + "/tools:/TOOL_DIR -v " + workingDirectory.string() + ":/FILES_DIR framac/frama-c-gui:dev bash -c '"
                                              "cd /FILES_DIR && "
                                              "frama-c -load-plugin slicing -eva -quiet "
                                              "-main main "
                                              "-slice-calls " + loop.functionName + " "
                                              "-slicing-level 3 -slicing-keep-annotations "
                                              "/FILES_DIR/" + inputProgramRelativePath + " "
                                              "-then-on \"Slicing export\" -print | awk \"/\\/\\* Generated by Frama-C \\*/ {found=1} found\" > /FILES_DIR/" + slicedVariant2RelativePath + "'";
                int result2_FramaC = system(command2_FramaC.c_str());
                if (result2_FramaC != 0) {
                    std::cerr << "Frama-C execution failed for second slice of " << inputProgramName << ", loop " << loop.lineNumber << "." << std::endl;
                    continue;
                }
                fixFramacBugs(inputProgramName, slicedVariant2Path.string());

                std::ifstream slicedProgram1InStream(slicedVariant1Path);
                std::stringstream slicedProgram1Buffer;
                slicedProgram1Buffer << slicedProgram1InStream.rdbuf();
                std::string slicedProgram1 = slicedProgram1Buffer.str();
                slicedProgram1InStream.close();

                std::ifstream slicedProgram2InStream(slicedVariant2Path);
                std::stringstream slicedProgram2Buffer;
                slicedProgram2Buffer << slicedProgram2InStream.rdbuf();
                std::string slicedProgram2 = slicedProgram2Buffer.str();
                slicedProgram2InStream.close();

                mergeSlicedPrograms(slicedProgram1, slicedProgram2, loop.functionName, mergedSlicedVariantPath);

                std::filesystem::remove(slicedVariant1Path);
                std::filesystem::remove(slicedVariant2Path);

                slicedVariants.push_back(mergedSlicedVariantPath);
            }
        }
    }

    for (const std::filesystem::path &slicedVariantPath : slicedVariants) {
        std::ifstream slicedVariantInStream(slicedVariantPath);
        std::stringstream slicedVariantBuffer;
        slicedVariantBuffer << slicedVariantInStream.rdbuf();
        std::string slicedVariantFile = slicedVariantBuffer.str();
        slicedVariantInStream.close();

        std::size_t acslStartPos = slicedVariantFile.find("/*@");
        while (acslStartPos != std::string::npos) {
            std::size_t acslEndPos = slicedVariantFile.find("*/", acslStartPos + 3);
            if (acslEndPos == std::string::npos) {
                slicedVariantFile.erase(acslStartPos);
                break;
            }
            std::size_t eraseLength = (acslEndPos - acslStartPos) + 2;
            if (acslEndPos + 3 < slicedVariantFile.size() && slicedVariantFile[acslEndPos + 2] == ' ' && slicedVariantFile[acslEndPos + 3] == ';') {
                eraseLength += 2;
            }
            slicedVariantFile.erase(acslStartPos, eraseLength);
            acslStartPos = slicedVariantFile.find("/*@", acslStartPos);
        }

        std::size_t headerPos = slicedVariantFile.find(header);
        if (headerPos != std::string::npos) {
            slicedVariantFile.erase(headerPos, header.size());
        }

        std::ofstream slicedVariantOutStream(slicedVariantPath, std::ios::trunc);
        slicedVariantOutStream << slicedVariantFile;
        slicedVariantOutStream.close();
    }

    return slicedVariants;
}

std::vector<std::filesystem::path> runConcretizer(const std::vector<std::filesystem::path> &inputProgramsDirectory, const std::filesystem::path &testCasesPath, const std::filesystem::path &concretizedVariantsDirectory) {
    std::vector<std::filesystem::path> concretizedVariants;

    std::ifstream testCasesStream(testCasesPath);

    auto parseCSVLine = [](const std::string &line) {
        std::vector<std::string> fields;
        std::string currentField;
        bool insideQuotes = false;
        for (size_t i = 0; i < line.size(); i++) {
            char c = line[i];
            if (c == '"') {
                if (insideQuotes && i + 1 < line.size() && line[i + 1] == '"') {
                    currentField.push_back('"');
                    i++;
                }
                else {
                    insideQuotes = !insideQuotes;
                }
            }
            else if (c == ',' && !insideQuotes) {
                fields.push_back(currentField);
                currentField.clear();
            }
            else {
                currentField.push_back(c);
            }
        }
        fields.push_back(currentField);
        return fields;
    };
    std::vector<std::vector<NondetAssignment>> allAssignments;
    std::string line;
    std::vector<std::string> columnNames;
    if (std::getline(testCasesStream, line)) {
        columnNames = parseCSVLine(line);
    }
    while (std::getline(testCasesStream, line)) {
        if (line.empty()) {
            continue;
        }
        std::vector<std::string> values = parseCSVLine(line);
        std::vector<NondetAssignment> rowAssignments;
        for (size_t columnIndex = 0; columnIndex < values.size() && columnIndex < columnNames.size(); columnIndex++) {
            if (columnNames[columnIndex] == "Label") {
                continue;
            }
            rowAssignments.push_back({columnNames[columnIndex], values[columnIndex]});
        }
        allAssignments.push_back(rowAssignments);
    }
    testCasesStream.close();

    for (const std::filesystem::path &inputProgramPath : inputProgramsDirectory) {
        std::string inputProgramName = inputProgramPath.stem().string();
        std::string inputProgramExtension = inputProgramPath.extension().string();

        std::ifstream inputProgramInStream(inputProgramPath);
        std::stringstream inputProgramBuffer;
        inputProgramBuffer << inputProgramInStream.rdbuf();
        std::string inputProgramFile = inputProgramBuffer.str();
        inputProgramInStream.close();

        if (allAssignments.empty()) {
            std::filesystem::path concretizedVariantPath = concretizedVariantsDirectory / (inputProgramName + "_TestCase0" + inputProgramExtension);
            std::filesystem::copy_file(inputProgramPath, concretizedVariantPath, std::filesystem::copy_options::overwrite_existing);
            concretizedVariants.push_back(concretizedVariantPath);
            continue;
        }

        for (size_t i = 0; i < allAssignments.size(); i++) {
            std::cout << "Generating concretized variant for " << inputProgramName << ", test case " << i + 1 << "..." << std::endl;

            std::vector<NondetAssignment> &assignments = allAssignments[i];
            std::string assignmentIndex = std::to_string(i + 1);

            clang::tooling::runToolOnCode(std::make_unique<concretizer::Action>(assignments, assignmentIndex), inputProgramFile);

            std::filesystem::path generatedConcretizedVariantPath = sourceCodeDirectory / (sourceCodeName + "_TestCase" + assignmentIndex + sourceCodeExtension);
            std::filesystem::path concretizedVariantPath = concretizedVariantsDirectory / (inputProgramName + "_TestCase" + assignmentIndex + inputProgramExtension);
            std::filesystem::rename(generatedConcretizedVariantPath, concretizedVariantPath);

            concretizedVariants.push_back(concretizedVariantPath);
        }
    }

    return concretizedVariants;
}

void analyzeVariant(const std::filesystem::path &inputProgramPath, const std::string &toolName, const std::string &benchmarkName, const std::string &timeout, const std::filesystem::path &resultsDirectory, const std::filesystem::path &toolDirectory, const std::filesystem::path &workingDirectory) {
    auto analysisTime_start = std::chrono::steady_clock::now();

    std::string inputProgramName = inputProgramPath.stem().string();
    std::string inputProgramExtension = inputProgramPath.extension().string();
    std::string inputProgramRelativePath = std::filesystem::relative(inputProgramPath, workingDirectory).generic_string();

    std::filesystem::path resultPath = resultsDirectory / (inputProgramName + ".txt");
    std::string resultRelativePath = std::filesystem::relative(resultPath, workingDirectory).generic_string();

    std::cout << "Running " << toolName << " on " << inputProgramName << "..." << std::endl;

    if (toolName == "Athena") {
        std::string inputFileName = inputProgramName;
        inputFileName = std::regex_replace(inputFileName, std::regex("_Loop[0-9]+"), "");
        inputFileName = std::regex_replace(inputFileName, std::regex("_TestCase[0-9]+"), "");
        inputFileName += inputProgramExtension;

        if (benchmarkName == "TermCOMP") {
            std::filesystem::path athenaDirectory = resultsDirectory / inputProgramName;
            std::filesystem::create_directories(athenaDirectory);
            std::filesystem::path copiedInputPath = athenaDirectory / inputFileName;
            std::filesystem::copy_file(inputProgramPath, copiedInputPath, std::filesystem::copy_options::overwrite_existing);

            std::string command_TermCOMP = toolDirectory.parent_path().string() + "/tools/Athena/cmake-build-debug/Athena" +
                                           " " + copiedInputPath.string() +
                                           " --timeout=" + timeout +
                                           " --semantic-augmentor-mode=none"
                                           " --type-annotator-mode=none"
                                           " --signedness-info=none"
                                           " --unreachable-exit=true"
                                           " --muval-mode=TermCOMP";
            int result_TermCOMP = system(command_TermCOMP.c_str());
            if (result_TermCOMP != 0) {
                std::cerr << toolName + " execution failed." << "\n";
            }

            std::filesystem::path athenaOutputPath = athenaDirectory / "Output.txt";
            if (std::filesystem::exists(athenaOutputPath)) {
                std::filesystem::copy_file(athenaOutputPath, resultPath, std::filesystem::copy_options::overwrite_existing);
            }
        }

        else if (benchmarkName == "FSE") {
            std::filesystem::path bitvectorDirectory = resultsDirectory / ("FSE_Bitvector_Mode/" + inputProgramName);
            std::filesystem::create_directories(bitvectorDirectory);
            std::filesystem::path bitvectorInputPath = bitvectorDirectory / inputFileName;
            std::filesystem::copy_file(inputProgramPath, bitvectorInputPath, std::filesystem::copy_options::overwrite_existing);

            std::string command_BV = toolDirectory.parent_path().string() + "/tools/Athena/cmake-build-debug/Athena" +
                                     " " + bitvectorInputPath.string() +
                                     " --timeout=" + timeout +
                                     " --semantic-augmentor-mode=none"
                                     " --type-annotator-mode=all"
                                     " --signedness-info=all"
                                     " --unreachable-exit=true"
                                     " --muval-mode=FSE-BV";
            int result_BV = system(command_BV.c_str());
            if (result_BV != 0) {
                std::cerr << toolName + "_BV execution failed." << "\n";
            }

            std::filesystem::path bitvectorOutputPath = bitvectorDirectory / "Output.txt";
            if (std::filesystem::exists(bitvectorOutputPath)) {
                std::filesystem::copy_file(bitvectorOutputPath, resultsDirectory / ("FSE_Bitvector_Mode_" + inputProgramName + ".txt"), std::filesystem::copy_options::overwrite_existing);
            }

            std::filesystem::path moduloArithmeticDirectory = resultsDirectory / ("FSE_Modulo_Arithmetic_Mode/" + inputProgramName);
            std::filesystem::create_directories(moduloArithmeticDirectory);
            std::filesystem::path moduloArithmeticInputPath = moduloArithmeticDirectory / inputFileName;
            std::filesystem::copy_file(inputProgramPath, moduloArithmeticInputPath, std::filesystem::copy_options::overwrite_existing);

            std::string command_MA = toolDirectory.parent_path().string() + "/tools/Athena/cmake-build-debug/Athena" +
                                     " " + moduloArithmeticInputPath.string() +
                                     " --timeout=" + timeout +
                                     " --semantic-augmentor-mode=only-nobv"
                                     " --type-annotator-mode=only-bv"
                                     " --signedness-info=only-bv"
                                     " --unreachable-exit=true"
                                     " --muval-mode=FSE-MI";
            int result_MA = system(command_MA.c_str());
            if (result_MA != 0) {
                std::cerr << toolName + "_MA execution failed." << "\n";
            }

            std::filesystem::path moduloArithmeticOutputPath = moduloArithmeticDirectory / "Output.txt";
            if (std::filesystem::exists(moduloArithmeticOutputPath)) {
                std::filesystem::copy_file(moduloArithmeticOutputPath, resultsDirectory / ("FSE_Modulo_Arithmetic_Mode_" + inputProgramName + ".txt"), std::filesystem::copy_options::overwrite_existing);
            }

            std::filesystem::path mathematicalIntegerDirectory = resultsDirectory / ("FSE_Mathematical_Integer_Mode/" + inputProgramName);
            std::filesystem::create_directories(mathematicalIntegerDirectory);
            std::filesystem::path mathematicalIntegerInputPath = mathematicalIntegerDirectory / inputFileName;
            std::filesystem::copy_file(inputProgramPath, mathematicalIntegerInputPath, std::filesystem::copy_options::overwrite_existing);

            std::string command_MI = toolDirectory.parent_path().string() + "/tools/Athena/cmake-build-debug/Athena" +
                                     " " + mathematicalIntegerInputPath.string() +
                                     " --timeout=" + timeout +
                                     " --semantic-augmentor-mode=none"
                                     " --type-annotator-mode=all"
                                     " --signedness-info=all"
                                     " --unreachable-exit=true"
                                     " --muval-mode=FSE-MI";
            int result_MI = system(command_MI.c_str());
            if (result_MI != 0) {
                std::cerr << toolName + "_MI execution failed." << "\n";
            }

            std::filesystem::path mathematicalIntegerOutputPath = mathematicalIntegerDirectory / "Output.txt";
            if (std::filesystem::exists(mathematicalIntegerOutputPath)) {
                std::filesystem::copy_file(mathematicalIntegerOutputPath, resultsDirectory / ("FSE_Mathematical_Integer_Mode_" + inputProgramName + ".txt"), std::filesystem::copy_options::overwrite_existing);
            }
        }
    }

    else if (toolName == "PROTON") {
        std::filesystem::path witnessPath = resultsDirectory / (inputProgramName + ".witness.graphml");
        std::string witnessRelativePath = std::filesystem::relative(witnessPath, workingDirectory).generic_string();

        std::string command_PROTON = "docker run --rm --platform linux/amd64 -v " + toolDirectory.parent_path().string() + "/tools/PROTON:/WORK -v " + workingDirectory.string() + ":/FILES_DIR -w /opt/term/proton proton bash -lc '"
                                     "timeout " + timeout + " ./proton --64 --propertyFile /opt/term/proton/termination.prp --graphml-witness /FILES_DIR/" + witnessRelativePath + " /FILES_DIR/" + inputProgramRelativePath + " > /FILES_DIR/" + resultRelativePath + " 2>&1'";
        int result_PROTON = system(command_PROTON.c_str());
        if (result_PROTON != 0) {
            std::cerr << toolName + " execution failed." << "\n";
        }
    }

    else if (toolName == "UAutomizer") {
        std::filesystem::path logPath = resultsDirectory / (inputProgramName + ".log");
        std::string logRelativePath = std::filesystem::relative(logPath, workingDirectory).generic_string();

        std::string command = "docker run --rm -v " + toolDirectory.parent_path().string() + "/tools:/TOOL_DIR -v " + workingDirectory.string() + ":/FILES_DIR uautomizer /bin/bash -c '"
                              "cd /opt/uautomizer/config && "
                              "ln -sf svcomp-Termination-64bit-Automizer_Default.epf svcomp-Termination-64bit-Automizer_Bitvector.epf && "
                              "timeout " + timeout + " python3 /opt/uautomizer/Ultimate.py --spec /TOOL_DIR/UAutomizer/termination.prp --file /FILES_DIR/" + inputProgramRelativePath + " --architecture 64bit > /FILES_DIR/" + resultRelativePath + " 2>&1 ; "
                              "if [ -f Ultimate.log ]; then cp Ultimate.log /FILES_DIR/" + logRelativePath + "; fi'";
        int result = system(command.c_str());
        if (result != 0) {
            std::cerr << toolName + " execution failed." << "\n";
        }
    }

    else if (toolName == "AProVE") {
        std::string command = "docker run --rm --platform linux/amd64 --entrypoint /bin/bash -v " + toolDirectory.parent_path().string() + "/tools:/TOOL_DIR -v " + workingDirectory.string() + ":/FILES_DIR nlommen/aprove_koat_loat:578822 -c '"
                              "timeout " + timeout + " /aprove/AProVE.sh -m wst --bit-width 64 /FILES_DIR/" + inputProgramRelativePath + " > /FILES_DIR/" + resultRelativePath + " 2>&1'";
        int result = system(command.c_str());
        if (result != 0) {
            std::cerr << toolName + " execution failed." << "\n";
        }
    }

    else if (toolName == "CPAchecker") {
        std::filesystem::path cpaOutputDirectory = resultsDirectory / inputProgramName;
        std::filesystem::create_directories(cpaOutputDirectory);
        std::string cpaOutputRelativePath = std::filesystem::relative(cpaOutputDirectory, workingDirectory).generic_string();

        std::string command = "docker run --rm --platform linux/amd64 --entrypoint /bin/bash -v " + toolDirectory.parent_path().string() + "/tools:/TOOL_DIR -v " + workingDirectory.string() + ":/FILES_DIR sosylab/cpachecker:dev -c '"
                              "timeout " + timeout + " /cpachecker/scripts/cpa.sh --config /cpachecker/config/terminationAnalysis.properties --preprocess --heap 10000M --64 --stats --output-path /FILES_DIR/" + cpaOutputRelativePath + " /FILES_DIR/" + inputProgramRelativePath + " > /FILES_DIR/" + resultRelativePath + " 2>&1'";
        int result = system(command.c_str());
        if (result != 0) {
            std::cerr << toolName + " execution failed." << "\n";
        }
    }

    else if (toolName == "2LS") {
        std::filesystem::path witnessPath = resultsDirectory / (inputProgramName + ".witness.graphml");
        std::string witnessRelativePath = std::filesystem::relative(witnessPath, workingDirectory).generic_string();

        std::string command = "docker run --rm -v " + toolDirectory.parent_path().string() + "/tools:/TOOL_DIR -v " + workingDirectory.string() + ":/FILES_DIR 2ls /bin/bash -c '"
                              "timeout " + timeout + " /root/2ls/src/2ls/2ls --graphml-witness /FILES_DIR/" + witnessRelativePath + " --termination --64 /FILES_DIR/" + inputProgramRelativePath + " > /FILES_DIR/" + resultRelativePath + " 2>&1'";
        int result = system(command.c_str());
        if (result != 0) {
            std::cerr << toolName + " execution failed." << "\n";
        }
    }

    auto analysisTime_end = std::chrono::steady_clock::now();
    auto analysisTime = std::chrono::duration_cast<std::chrono::milliseconds>(analysisTime_end - analysisTime_start).count();
    std::ofstream(resultPath, std::ios::app) << "AnalysisTime: " << analysisTime << " milliseconds" << std::endl;
}