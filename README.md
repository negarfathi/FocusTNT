# FocusTNT

FocusTNT is a tool-agnostic preprocessing and evaluation framework for termination and non-termination analysis of C/C++ programs. It applies loop-based slicing and input-driven concretization before invoking existing termination analyzers, allowing the effects of different preprocessing strategies to be evaluated systematically.

FocusTNT provides two main workflows:

1.  **Input generation** -- generates and validates concrete assignments for nondeterministic program inputs using an LLM.
2.  **Termination/non-termination analysis** -- constructs program variants using different preprocessing configurations, executes existing analyzers, and records the results.

The two preprocessing transformations are:

-   **Loop-based slicing** -- isolates the code relevant to individual target loops.
-   **Input-driven concretization** -- replaces nondeterministic inputs with concrete values from generated test cases.

FocusTNT evaluates five configurations:

| Configuration | Description |
| --- | --- |
| **base** | No preprocessing |
| **slice** | Loop-based slicing only |
| **cncrt** | Input-driven concretization only |
| **slice+cncrt** | Slicing followed by concretization |
| **cncrt+slice** | Concretization followed by slicing |

The evaluation supports the following termination and non-termination analyzers:

-   [Athena](https://github.com/negarfathi/Athena)
-   [PROTON](https://github.com/kumarmadhukar/term/tree/main/proton)
-   [UAutomizer](https://www.ultimate-pa.org/automizer/)
-   [AProVE](https://aprove.informatik.rwth-aachen.de/)
-   [CPAchecker](https://cpachecker.sosy-lab.org/)
-   [2LS](https://github.com/diffblue/2LS)

The current evaluation uses the benchmark suite of [Shi et al.](https://github.com/FSE2022benchmarks/-FSE-2022-Termination/tree/v1.0).

## Requirements

Before installing FocusTNT, ensure that the following requirements are satisfied:

- Linux operating system
- C/C++ compiler with C++23 support
- LLVM/Clang
- CMake ≥ 3.27
- Make
- Git
- Docker
- Curl
- NVIDIA CUDA-capable GPU

The provided `install_FocusTNT.sh` script installs and configures the remaining dependencies, including Frama-C, xlnt, Athena, PROTON, UAutomizer, AProVE, CPAchecker, 2LS, a Python 3.12 environment, vLLM 0.28.0, and gpt-oss-20b.

## Installation

Clone the repository:

``` bash
git clone https://github.com/negarfathi/FocusTNT.git
cd FocusTNT
```

Run the installation script:

``` bash
./install_FocusTNT.sh
```

The script installs and configures the required dependencies, including:

-   [Frama-C](https://frama-c.com/) for loop-based slicing
-   [xlnt](https://github.com/xlnt-community/xlnt) for Excel result generation
-   [Athena](https://github.com/negarfathi/Athena)
-   [PROTON](https://github.com/kumarmadhukar/term/tree/main/proton)
-   [UAutomizer](https://www.ultimate-pa.org/automizer/)
-   [AProVE](https://aprove.informatik.rwth-aachen.de/)
-   [CPAchecker](https://cpachecker.sosy-lab.org/)
-   [2LS](https://github.com/diffblue/2LS)
-   `uv` and a Python 3.12 virtual environment
-   `vLLM 0.28.0`
-   `gpt-oss-20b`

It then builds FocusTNT in `cmake-build-debug/`.

After successful installation, the executable is located at:

``` text
cmake-build-debug/FocusTNT
```

## Input Generation

FocusTNT generates concrete test inputs for programs containing nondeterministic inputs. Each generated assignment is concretized into the source program, compiled, and executed to validate its observed termination behavior. The resulting test cases are used by the input-driven concretization configurations during analysis.

To run input generation for all benchmark programs, execute:

```bash
./run_InputGeneration.sh
```

The script starts a local vLLM server and runs the following FocusTNT command for each terminating (`_T.c`/`_T.cpp`) and non-terminating (`_NT.c`/`_NT.cpp`) program in the benchmark directory:

```bash
./FocusTNT \
    --input-generation \
    <path/to/source_code.c> \
    --model=<model> \
    --temperature=<0.0-2.0> \
    --reasoning-effort=<low|medium|high> \
    --max-attempts=<number> \
    --num-inputs=<number> \
    --execution-timeout=<seconds>
```

The command-line arguments are:

- `--input-generation`: enables the input-generation workflow for the specified source program.
- `<path/to/source_code.c>`: specifies the C/C++ program for which inputs are generated.
- `--model`: specifies the LLM used to generate candidate input assignments.
- `--temperature`: specifies the sampling temperature used for LLM generation.
- `--reasoning-effort`: specifies the model reasoning effort (`low`, `medium`, or `high`).
- `--max-attempts`: specifies the maximum number of LLM generation attempts for a program. For a non-terminating program, the attempt budget is divided equally between terminating and non-terminating input generation.
- `--num-inputs`: specifies the target number of test inputs. For a non-terminating program, the target is divided equally between terminating and non-terminating inputs.
- `--execution-timeout`: specifies, in seconds, the maximum execution time allowed for each concretized program.

The full evaluation uses the following settings:

```text
Model:             gpt-oss-20b
Temperature:       1
Reasoning effort:  medium
Maximum attempts:  100
Number of inputs:  20
Execution timeout: 300 seconds
```

With these settings, FocusTNT targets 20 terminating inputs for each terminating program, with up to 100 generation attempts. For each non-terminating program, it targets 10 terminating and 10 non-terminating inputs, with up to 50 generation attempts for each class.

Duplicate assignments and candidates that fail generation or compilation are rejected. A candidate that reaches the execution timeout is treated as likely non-terminating and retained for manual validation. A candidate that encounters a runtime failure is retained with a pending label for manual classification rather than being automatically classified as terminating or non-terminating.

The generated results are stored under:

```text
results_InputGeneration/
```

The original benchmark directory structure is preserved. For each processed program, the input-generation outputs are organized as follows:

```text
<program>/
├── <program>.c
├── test_cases.csv
└── input_generator_artifacts/
    ├── generation_configuration.txt
    ├── generation_history.csv
    └── generated_programs/
        ├── <program>_TestCase1.c
        ├── <program>_TestCase2.c
        ├── ...
        └── <program>_TestCase20.c
```

The generated outputs are:

- `test_cases.csv`: contains the generated input assignments and their validated termination/non-termination labels. These test cases are subsequently used by the input-driven concretization configurations during analysis.
- `generation_configuration.txt`: records the input-generation configuration, including the model and generation parameters used for the program.
- `generation_history.csv`: records the generation attempts and their outcomes, including the requested execution class, generated assignments, execution results, labels, acceptance status, and errors when applicable.
- `generated_programs/`: contains the concretized source programs corresponding to the generated test cases. Each program replaces the nondeterministic inputs with the concrete values of its corresponding test case and is retained for reproducibility and manual validation.

Candidates marked as likely non-terminating or pending manual classification are manually validated before the final test cases are used in the analysis workflow.

## Termination/Non-Termination Analysis

FocusTNT evaluates termination and non-termination analyzers on the original and preprocessed program variants. Depending on the selected configuration, it applies loop-based slicing, input-driven concretization, or their sequential combination before invoking the selected analyzer.

After input generation and validation are complete, run:

```bash
./run_Analysis.sh
```

The script runs the following FocusTNT command for each benchmark program, analyzer, and preprocessing configuration:

```bash
./FocusTNT \
    --analysis \
    <path/to/source_code.c> \
    <path/to/test_cases.csv> \
    <path/to/ground_truth.csv> \
    --tool=<Athena|PROTON|UAutomizer|AProVE|CPAchecker|2LS> \
    --benchmark=<TermCOMP|FSE> \
    --configuration=<base|slice|cncrt|slice_cncrt|cncrt_slice> \
    --timeout=<seconds>
```

The command-line arguments are:

- `--analysis`: enables the termination/non-termination analysis workflow.
- `<path/to/source_code.c>`: specifies the C/C++ program to analyze.
- `<path/to/test_cases.csv>`: specifies the generated test cases used for input-driven concretization.
- `<path/to/ground_truth.csv>`: specifies the ground-truth labels for the original and generated program variants.
- `--tool`: specifies the analyzer (`Athena`, `PROTON`, `UAutomizer`, `AProVE`, `CPAchecker`, or `2LS`).
- `--benchmark`: specifies the benchmark suite (`FSE` or `TermCOMP`) and determines the analyzer configuration used for its integer semantics.
- `--configuration`: specifies the preprocessing configuration (`base`, `slice`, `cncrt`, `slice_cncrt`, or `cncrt_slice`).
- `--timeout`: specifies, in seconds, the maximum analysis time allowed for each program variant.

FocusTNT uses `ground_truth.csv` to associate each original or generated program variant with its ground-truth termination (`T`) or non-termination (`NT`) result. The file contains ground-truth entries for the `base`, `slice`, `cncrt`, `slice_cncrt`, and `cncrt_slice` variants and is used to evaluate analyzer verdicts against the ground-truth result.

FocusTNT distinguishes between the [`FSE` benchmark suite of Shi et al.](https://github.com/FSE2022benchmarks/-FSE-2022-Termination/tree/v1.0) and the [`TermCOMP` benchmark suite](https://github.com/TermCOMP/TPDB/tree/master/C) because they use different integer semantics. The FSE benchmarks are evaluated under bounded (machine) integer semantics, whereas the TermCOMP benchmarks are evaluated under mathematical integer semantics. FocusTNT therefore invokes each analyzer with the settings appropriate for the selected benchmark suite.

The five preprocessing configurations are:

- `base`: analyzes the original program without preprocessing.
- `slice`: applies loop-based slicing and analyzes each resulting loop-specific variant.
- `cncrt`: applies input-driven concretization using the generated test cases and analyzes each resulting concretized variant.
- `slice_cncrt`: applies loop-based slicing followed by input-driven concretization.
- `cncrt_slice`: applies input-driven concretization followed by loop-based slicing.

The full evaluation uses the following settings:

```text
Analyzers:      Athena, PROTON, UAutomizer, AProVE, CPAchecker, 2LS
Benchmark:      FSE
Configurations: base, slice, cncrt, slice_cncrt, cncrt_slice
Timeout:        300 seconds
```

For each configuration, FocusTNT records the analyzer verdict and analysis time for every generated variant. It also measures the preprocessing time required to generate the variants; preprocessing time is zero for `base` and is distributed across the generated variants for the other configurations.

The analysis results are stored under:

```text
results_Analysis/
```

The results are organized by analyzer and preprocessing configuration:

```text
results_Analysis/
├── Athena/
│   ├── base/
│   ├── slice/
│   ├── cncrt/
│   ├── slice+cncrt/
│   └── cncrt+slice/
├── PROTON/
├── UAutomizer/
├── AProVE/
├── CPAchecker/
└── 2LS/
```

Each analyzer/configuration directory preserves the corresponding benchmark hierarchy together with the generated program variants and analyzer artifacts.

The evaluation results are additionally recorded in:

```text
results_FSE.xlsx
```

The workbook contains the program and variant identifiers, loop and test-case identifiers, ground-truth labels, analyzer verdicts, preprocessing times, and analysis times used for the subsequent evaluation.

## Related Papers

This repository is based on the following work:

N. Fathi, H. Unno, T. Terauchi, and R. Purandare, “Loop-Based Slicing and Input-Driven Concretization: An Empirical Study of Termination and Non-Termination Analysis,” *arXiv preprint* [arXiv:2607.08988](https://doi.org/10.48550/arXiv.2607.08988), 2026. [Under review at *IEEE Transactions on Software Engineering*.]
