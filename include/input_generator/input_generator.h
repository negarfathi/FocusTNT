#ifndef INPUT_GENERATOR_H
#define INPUT_GENERATOR_H

#include <fstream>
#include <sstream>
#include <curl/curl.h>
#include <unordered_set>
#include <nlohmann/json.hpp>

#include "../nondet_extractor/nondet_input.h"
#include "../concretizer/nondet_assignment.h"

enum class GenerationTarget {
    Terminating,
    NonTerminating
};

struct GenerationConfiguration {
    std::string model;
    double temperature;
    std::string reasoningEffort;
    std::string vllmBaseUrl;
};

class InputGenerator {
public:
    explicit InputGenerator(GenerationConfiguration configuration);

    std::vector<NondetAssignment> Generate(const std::string& sourceFile, const std::vector<NondetInput>& inputs, GenerationTarget target, const std::vector<std::vector<NondetAssignment>>& previousAssignments, std::string& prompt);

private:
    GenerationConfiguration configuration;
};

#endif // INPUT_GENERATOR_H