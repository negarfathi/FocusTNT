cmake_minimum_required(VERSION 3.27)
project(FocusTNT)

# Set the C++ standard to C++23
set(CMAKE_CXX_STANDARD 23)

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

add_executable(FocusTNT
        src/main.cpp

        include/file/info.h
        src/file/info.cpp

        include/slicer/loop_descriptor.h
        include/slicer/action.h
        src/slicer/action.cpp
        include/slicer/consumer.h
        src/slicer/consumer.cpp
        include/slicer/visitor_and_rewriter.h
        src/slicer/visitor_and_rewriter.cpp
        src/slicer/merge_sliced_programs.cpp
        src/slicer/fix_framac_bugs.cpp

        include/concretizer/variable_assignment.h
        include/concretizer/action.h
        src/concretizer/action.cpp
        include/concretizer/consumer.h
        src/concretizer/consumer.cpp
        include/concretizer/visitor_and_rewriter.h
        src/concretizer/visitor_and_rewriter.cpp

        include/result_processor/result_processor.h
        src/result_processor/result_processor.cpp
)

set(XLNT_ROOT ${CMAKE_SOURCE_DIR}/tools/XLNT/xlnt)
set(XLNT_LIB ${XLNT_ROOT}/build/source/libxlnt.dylib)
include_directories(${XLNT_ROOT}/include)

# Link against specific LLVM and Clang libraries
target_link_libraries(FocusTNT
        LLVM
        clangAST
        clangFrontend
        clangTooling
        ${XLNT_LIB}
)