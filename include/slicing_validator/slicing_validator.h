#ifndef SLICING_VALIDATOR_H
#define SLICING_VALIDATOR_H

#include <set>
#include <regex>
#include <thread>
#include <fcntl.h>
#include <fstream>
#include <signal.h>
#include <unistd.h>
#include <sys/wait.h>
#include <filesystem>
#include <xlnt/xlnt.hpp>

#include <clang/Tooling/Tooling.h>

#include "../../include/slicer/visitor_and_rewriter.h"
#include "../../include/concretizer/visitor_and_rewriter.h"
#include "../../include/nondet_extractor/visitor_and_rewriter.h"

int validateSlicedPrograms(const std::filesystem::path &programDirectory, const std::filesystem::path &projectRoot);

#endif //SLICING_VALIDATOR_H
