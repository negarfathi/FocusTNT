cmake_minimum_required(VERSION 3.27)
project(FocusTNT)

# Set the C++ standard to C++23
set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# macOS package paths
if(APPLE)
    list(APPEND CMAKE_PREFIX_PATH
            "/opt/homebrew"
            "/opt/homebrew/opt/llvm"
            "/opt/homebrew/opt/nlohmann-json"
            "/opt/homebrew/opt/curl"
            "/usr/local"
            "/usr/local/opt/llvm"
            "/usr/local/opt/nlohmann-json"
            "/usr/local/opt/curl"
    )
endif()

# Find LLVM package
find_package(LLVM REQUIRED CONFIG)
message(STATUS "Found LLVM ${LLVM_PACKAGE_VERSION}")
message(STATUS "Using LLVMConfig.cmake in: ${LLVM_DIR}")

# Include LLVM headers
include_directories(${LLVM_INCLUDE_DIRS})
add_definitions(${LLVM_DEFINITIONS})

# Find Clang package
find_package(Clang REQUIRED CONFIG)
message(STATUS "Using ClangConfig.cmake in: ${CLANG_DIR}")

# Include Clang headers
include_directories(${CLANG_INCLUDE_DIRS})

# JSON
find_package(nlohmann_json CONFIG REQUIRED)

# CURL
find_package(CURL REQUIRED)
message(STATUS "Found CURL ${CURL_VERSION_STRING}")

add_executable(FocusTNT
        src/main.cpp

        include/file/info.h
        src/file/info.cpp

        include/nondet_extractor/nondet_input.h
        include/nondet_extractor/action.h
        src/nondet_extractor/action.cpp
        include/nondet_extractor/consumer.h
        src/nondet_extractor/consumer.cpp
        include/nondet_extractor/visitor_and_rewriter.h
        src/nondet_extractor/visitor_and_rewriter.cpp

        include/input_generator/input_generator.h
        src/input_generator/input_generator.cpp

        include/slicer/loop_descriptor.h
        include/slicer/action.h
        src/slicer/action.cpp
        include/slicer/consumer.h
        src/slicer/consumer.cpp
        include/slicer/visitor_and_rewriter.h
        src/slicer/visitor_and_rewriter.cpp
        include/slicer/fix_framac_bugs.h
        src/slicer/fix_framac_bugs.cpp
        include/slicer/merge_sliced_program.h
        src/slicer/merge_sliced_programs.cpp

        include/concretizer/nondet_assignment.h
        include/concretizer/action.h
        src/concretizer/action.cpp
        include/concretizer/consumer.h
        src/concretizer/consumer.cpp
        include/concretizer/visitor_and_rewriter.h
        src/concretizer/visitor_and_rewriter.cpp

        include/result_recorder/result_recorder.h
        src/result_recorder/result_recorder.cpp
)

# XLNT
set(XLNT_ROOT ${CMAKE_SOURCE_DIR}/tools/XLNT/xlnt)

if(NOT EXISTS "${XLNT_ROOT}/include/xlnt/xlnt.hpp")
    message(FATAL_ERROR
            "XLNT is not installed. Run ./tools/XLNT/install_xlnt.sh first."
    )
endif()

if(APPLE)
    set(XLNT_LIB ${XLNT_ROOT}/build/source/libxlnt.dylib)
else()
    set(XLNT_LIB ${XLNT_ROOT}/build/source/libxlnt.so)
endif()

if(NOT EXISTS "${XLNT_LIB}")
    message(FATAL_ERROR
            "XLNT library not found at ${XLNT_LIB}. Run ./tools/XLNT/install_xlnt.sh first."
    )
endif()

target_include_directories(FocusTNT
        PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}/include
        ${XLNT_ROOT}/include
)

# Link against LLVM, Clang, JSON, CURL, and XLNT
target_link_libraries(FocusTNT
        PRIVATE
        LLVM
        clangAST
        clangFrontend
        clangTooling
        nlohmann_json::nlohmann_json
        CURL::libcurl
        ${XLNT_LIB}
)