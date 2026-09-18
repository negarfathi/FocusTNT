#include "../../include/input_generator/input_generator.h"

static std::string buildPrompt(const std::string& sourceCode, const std::vector<NondetInput>& inputs, GenerationTarget target, const std::vector<std::vector<NondetAssignment>>& previousAssignments) {
    std::ostringstream prompt;
    prompt
        << "You generate concrete values for nondeterministic inputs in a C/C++ program.\n"
        << "Your goal is to produce ONE complete assignment set that is likely to make the program "
        << (target == GenerationTarget::Terminating ? "terminate." : "not terminate.")
        << "\n\n"
        << "Important rules:\n"
        << "1. Return a value for EVERY listed nondeterministic input ID.\n"
        << "2. Use each ID exactly once.\n"
        << "3. Respect the declared C/C++ type.\n"
        << "4. For an array, return the value as an array containing exactly the required number of elements.\n"
        << "5. For char arrays, each element must be exactly one character. Return the character itself without C single quotes.\n"
        << "\nNondeterministic inputs:\n";
    for (const auto& input : inputs) {
        prompt << "- id: " << input.id << ", type: " << input.type;
        if (input.isArray) {
            prompt << ", array: true, size: " << input.arraySizeExpresion << ", required elements: " << input.arraySizeExpresion;
        }
        prompt << '\n';
    }
    if (!previousAssignments.empty()) {
        prompt << "\nPreviously generated assignment sets are listed below. Generate a materially different set and do not duplicate any of them.\n";
        for (std::size_t i = 0; i < previousAssignments.size(); ++i) {
            prompt << "Previous " << (i + 1) << ": ";
            for (const auto& assignment : previousAssignments[i]) {
                prompt << assignment.id << '=' << assignment.value << "; ";
            }
            prompt << '\n';
        }
    }
    prompt << "\nProgram:\n" << sourceCode << '\n';
    return prompt.str();
}


static std::string sendRequest(const GenerationConfiguration& configuration, const std::string& prompt, const std::vector<NondetInput>& inputs) {
    nlohmann::json request;
    std::string url;
    std::string authorizationHeader;
    bool isOpenAI = configuration.model.rfind("gpt-5", 0) == 0 && configuration.model.rfind("gpt-oss", 0) != 0;
    bool isVllm = configuration.model.rfind("gpt-oss", 0) == 0;
    if (isOpenAI) {
        const char* apiKey = std::getenv("OPENAI_API_KEY");
        if (apiKey == nullptr || std::string(apiKey).empty()) {
            throw std::runtime_error("OPENAI_API_KEY is not set.");
        }
        request = {
            {"model", configuration.model},
            {"input", prompt},
            {"reasoning", {{"effort", configuration.reasoningEffort}}},
            {"temperature", configuration.temperature}
        };
        url = "https://api.openai.com/v1/responses";
        authorizationHeader = "Authorization: Bearer " + std::string(apiKey);
    }
    else if (isVllm) {
        std::string baseUrl = configuration.vllmBaseUrl;
        if (baseUrl.empty()) {
            const char* environmentUrl = std::getenv("VLLM_BASE_URL");
            if (environmentUrl != nullptr) {
                baseUrl = environmentUrl;
            }
        }
        if (baseUrl.empty()) {
            baseUrl = "http://localhost:8000";
        }
        while (!baseUrl.empty() && baseUrl.back() == '/') {
            baseUrl.pop_back();
        }
        nlohmann::json assignmentItems = nlohmann::json::array();
        for (const auto& input : inputs) {
            nlohmann::json valueSchema;
            if (input.isArray) {
                nlohmann::json itemSchema = {
                    {"type", "string"}
                };
                if (input.type == "char") {
                    itemSchema["minLength"] = 1;
                    itemSchema["maxLength"] = 1;
                    itemSchema["pattern"] = "^[\\x00-\\x7F]$";
                }
                else if (input.type == "float" || input.type == "double" || input.type == "long double") {
                    itemSchema["pattern"] = "^[+-]?(?:[0-9]+(?:\\.[0-9]*)?|\\.[0-9]+)(?:[eE][+-]?[0-9]+)?$";
                }
                else {
                    itemSchema["pattern"] = "^[+-]?[0-9]+$";
                }
                try {
                    std::size_t arraySize = std::stoul(input.arraySizeExpresion);
                    valueSchema = {
                        {"type", "array"},
                        {"items", itemSchema},
                        {"minItems", arraySize},
                        {"maxItems", arraySize}
                    };
                }
                catch (...) {
                    valueSchema = {
                        {"type", "array"},
                        {"items", itemSchema}
                    };
                }
            }
            else {
                valueSchema = {
                    {"type", "string"}
                };
                if (input.type == "char") {
                    valueSchema["minLength"] = 1;
                    valueSchema["maxLength"] = 1;
                    valueSchema["pattern"] = "^[\\x00-\\x7F]$";
                }
                else if (input.type == "float" || input.type == "double" || input.type == "long double") {
                    valueSchema["pattern"] = "^[+-]?(?:[0-9]+(?:\\.[0-9]*)?|\\.[0-9]+)(?:[eE][+-]?[0-9]+)?$";
                }
                else {
                    valueSchema["pattern"] = "^[+-]?[0-9]+$";
                }
            }
            assignmentItems.push_back({
                {"type", "object"},
                {"properties", {
                    {"id", {
                        {"type", "string"},
                        {"const", input.id}
                    }},
                    {"value", valueSchema}
                }},
                {"required", {"id", "value"}},
                {"additionalProperties", false}
            });
        }
        nlohmann::json schema = {
            {"type", "object"},
            {"properties", {
            {"assignments", {
                {"type", "array"},
                {"prefixItems", assignmentItems},
                {"minItems", inputs.size()},
                {"maxItems", inputs.size()}
            }}
            }},
            {"required", {"assignments"}},
            {"additionalProperties", false}
        };
        request = {
            {"model", configuration.model},
            {"messages", nlohmann::json::array({
                {
                    {"role", "user"},
                    {"content", prompt}
                }
            })},
            {"temperature", configuration.temperature},
            {"reasoning_effort", configuration.reasoningEffort},
            {"response_format", {
            {"type", "json_schema"},
            {"json_schema", {
                {"name", "nondeterministic_assignments"},
                {"schema", schema}
            }}
            }}
        };
        url = baseUrl + "/v1/chat/completions";
    }
    else {
        throw std::runtime_error("Unsupported model: " + configuration.model);
    }
    const std::string requestBody = request.dump();
    static const bool curlInitialized = []() {
        return curl_global_init(CURL_GLOBAL_DEFAULT) == CURLE_OK;
    }();
    if (!curlInitialized) {
        throw std::runtime_error("Failed to initialize libcurl.");
    }
    CURL* curl = curl_easy_init();
    if (curl == nullptr) {
        throw std::runtime_error("Failed to create CURL request handle.");
    }
    struct curl_slist* headers = nullptr;
    headers = curl_slist_append(headers, "Content-Type: application/json");
    if (isOpenAI) {
        headers = curl_slist_append(headers, authorizationHeader.c_str());
    }
    std::string responseBody;
    curl_easy_setopt(curl, CURLOPT_URL, url.c_str());
    curl_easy_setopt(curl, CURLOPT_HTTPHEADER, headers);
    curl_easy_setopt(curl, CURLOPT_POST, 1L);
    curl_easy_setopt(curl, CURLOPT_POSTFIELDS, requestBody.c_str());
    curl_easy_setopt(curl, CURLOPT_POSTFIELDSIZE, static_cast<long>(requestBody.size()));
    curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, +[](char* ptr, size_t size, size_t nmemb, void* userdata) -> size_t {
        auto* output = static_cast<std::string*>(userdata);
        output->append(ptr, size * nmemb);
        return size * nmemb;
    });
    curl_easy_setopt(curl, CURLOPT_WRITEDATA, &responseBody);
    curl_easy_setopt(curl, CURLOPT_CONNECTTIMEOUT, 30L);
    curl_easy_setopt(curl, CURLOPT_TIMEOUT, 600L);
    const CURLcode curlCode = curl_easy_perform(curl);
    long statusCode = 0;
    curl_easy_getinfo(curl, CURLINFO_RESPONSE_CODE, &statusCode);
    curl_slist_free_all(headers);
    curl_easy_cleanup(curl);
    if (curlCode != CURLE_OK) {
        throw std::runtime_error("HTTP request failed: " + std::string(curl_easy_strerror(curlCode)));
    }
    nlohmann::json response;
    try {
        response = nlohmann::json::parse(responseBody);
    }
    catch (const std::exception& exception) {
        throw std::runtime_error("Failed to parse model response: " + std::string(exception.what()));
    }
    if (statusCode < 200 || statusCode >= 300) {
        throw std::runtime_error("HTTP " + std::to_string(statusCode) + ": " + response.dump());
    }
    if (isOpenAI) {
        if (response.contains("output") && response.at("output").is_array()) {
            for (const auto& output : response.at("output")) {
                if (!output.contains("content") || !output.at("content").is_array()) {
                    continue;
                }
                for (const auto& content : output.at("content")) {
                    if (content.contains("type") && content.at("type").is_string() && content.at("type").get<std::string>() == "output_text" && content.contains("text") && content.at("text").is_string()) {
                        return content.at("text").get<std::string>();
                    }
                }
            }
        }
        if (response.contains("output_text") && response.at("output_text").is_string()) {
            return response.at("output_text").get<std::string>();
        }
        throw std::runtime_error("OpenAI returned no assignment content: " + response.dump());
    }
    if (!response.contains("choices") || !response.at("choices").is_array() || response.at("choices").empty()) {
        throw std::runtime_error("vLLM response contains no choices: " + response.dump());
    }
    const nlohmann::json& choice = response.at("choices").at(0);
    if (!choice.contains("message") || !choice.at("message").is_object()) {
        throw std::runtime_error("vLLM response contains no message: " + response.dump());
    }
    const nlohmann::json& message = choice.at("message");
    if (!message.contains("content") || !message.at("content").is_string() || message.at("content").get<std::string>().empty()) {
        throw std::runtime_error("vLLM returned empty assignment content: " + response.dump());
    }
    return message.at("content").get<std::string>();
}

static std::vector<NondetAssignment> parseAssignments(const std::string& responseText, const std::vector<NondetInput>& inputs) {
    nlohmann::json response;
    try {
        response = nlohmann::json::parse(responseText);
    }
    catch (const std::exception&) {
        throw std::runtime_error("Model output is not valid JSON:\n" + responseText);
    }
    if (!response.contains("assignments") || !response.at("assignments").is_array()) {
        throw std::runtime_error("Model output does not contain an assignments array:\n" + responseText);
    }
    std::unordered_map<std::string, std::string> returnedValues;
    for (const auto& item : response.at("assignments")) {
        if (!item.is_object() || !item.contains("id") || !item.at("id").is_string() || !item.contains("value")) {
            throw std::runtime_error("Invalid assignment object in model output:\n" + responseText);
        }
        const std::string id = item.at("id").get<std::string>();
        auto inputIterator = std::find_if(inputs.begin(), inputs.end(), [&](const NondetInput& input) {
            return input.id == id;
        });
        if (inputIterator == inputs.end()) {
            throw std::runtime_error("Model returned unknown ID: " + id);
        }
        std::string value;
        if (inputIterator->isArray) {
            if (!item.at("value").is_array()) {
                throw std::runtime_error("Model returned a non-array value for array ID: " + id);
            }
            std::ostringstream initializer;
            initializer << "{";
            for (std::size_t i = 0; i < item.at("value").size(); ++i) {
                if (!item.at("value").at(i).is_string()) {
                    throw std::runtime_error("Model returned a non-string array element for ID: " + id);
                }
                if (i > 0) {
                    initializer << ",";
                }
                std::string element = item.at("value").at(i).get<std::string>();
                if (inputIterator->type == "char") {
                    if (element.size() == 1 && element[0] == '\0') {
                        initializer << "'\\0'";
                    }
                    else if (element == "\n") {
                        initializer << "'\\n'";
                    }
                    else if (element == "\r") {
                        initializer << "'\\r'";
                    }
                    else if (element == "\t") {
                        initializer << "'\\t'";
                    }
                    else if (element == "\\") {
                        initializer << "'\\\\'";
                    }
                    else if (element == "'") {
                        initializer << "'\\''";
                    }
                    else {
                        initializer << "'" << element << "'";
                    }
                }
                else {
                    initializer << element;
                }
            }
            initializer << "}";
            value = initializer.str();
        }
        else {
            if (!item.at("value").is_string()) {
                throw std::runtime_error("Model returned a non-string value for ID: " + id);
            }
            value = item.at("value").get<std::string>();
            if (inputIterator->type == "char") {
                if (value.size() == 1 && value[0] == '\0') {
                    value = "'\\0'";
                }
                else if (value == "\n") {
                    value = "'\\n'";
                }
                else if (value == "\r") {
                    value = "'\\r'";
                }
                else if (value == "\t") {
                    value = "'\\t'";
                }
                else if (value == "\\") {
                    value = "'\\\\'";
                }
                else if (value == "'") {
                    value = "'\\''";
                }
                else {
                    value = "'" + value + "'";
                }
            }
        }
        auto [iterator, inserted] = returnedValues.emplace(id, value);
        if (!inserted) {
            throw std::runtime_error("Model returned duplicate ID: " + id);
        }
    }
    std::unordered_set<std::string> expectedIds;
    for (const auto& input : inputs) {
        expectedIds.insert(input.id);
    }
    for (const auto& [id, value] : returnedValues) {
        if (!expectedIds.contains(id)) {
            throw std::runtime_error("Model returned unknown ID: " + id);
        }
    }
    std::vector<NondetAssignment> assignments;
    assignments.reserve(inputs.size());
    for (const auto& input : inputs) {
        auto iterator = returnedValues.find(input.id);
        if (iterator == returnedValues.end()) {
            throw std::runtime_error("Model did not return a value for ID: " + input.id);
        }
        assignments.push_back({input.id, iterator->second});
    }
    return assignments;
}

InputGenerator::InputGenerator(GenerationConfiguration configuration) : configuration(std::move(configuration)) {
    if (this->configuration.model.empty()) {
        throw std::invalid_argument("GenerationConfig.model must not be empty.");
    }
    if (this->configuration.temperature < 0.0 || this->configuration.temperature > 2.0) {
        throw std::invalid_argument("temperature must be in [0, 2].");
    }
}

std::vector<NondetAssignment> InputGenerator::Generate(const std::string& sourceFile, const std::vector<NondetInput>& inputs, GenerationTarget target, const std::vector<std::vector<NondetAssignment>>& previousAssignments, std::string& prompt) {
    if (inputs.empty()) {
        return {};
    }
    std::ifstream sourceStream(sourceFile);
    if (!sourceStream) {
        throw std::runtime_error("Could not open source file: " + sourceFile);
    }
    std::ostringstream sourceBuffer;
    sourceBuffer << sourceStream.rdbuf();
    prompt = buildPrompt(sourceBuffer.str(), inputs, target, previousAssignments);
    const std::string response = sendRequest(configuration, prompt, inputs);
    return parseAssignments(response, inputs);
}