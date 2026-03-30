#ifndef LOOP_DESCRIPTOR_H
#define LOOP_DESCRIPTOR_H

struct LoopDescriptor {
    std::string functionName;
    std::string lineNumber;
    std::vector<std::string> conditionVariables;
    bool hasEarlyExits = false;
};

#endif //LOOP_DESCRIPTOR_H