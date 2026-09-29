#ifndef FIX_FRAMAC_BUGS_H
#define FIX_FRAMAC_BUGS_H

#include <regex>
#include <vector>
#include <fstream>
#include <sstream>
#include <iostream>
#include <filesystem>
#include <unordered_map>

void fixFramacBugs(const std::filesystem::path& slicedVariantPath, const std::filesystem::path& inputProgramPath);

#endif // FIX_FRAMAC_BUGS_H