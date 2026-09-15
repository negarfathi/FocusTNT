#ifndef NONDET_EXTRACTOR_NONDET_INPUT_H
#define NONDET_EXTRACTOR_NONDET_INPUT_H

struct NondetInput {
    std::string id;
    std::string type;
    bool isArray = false;
    std::string arraySizeExpresion;
};

#endif // NONDET_EXTRACTOR_NONDET_INPUT_H
