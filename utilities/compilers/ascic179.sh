#!/bin/bash

# gcc
SIERRA_GCC_DIR=$(./utilities/sierra-gcc-dir.sh)
spack compiler find ${SIERRA_GCC_DIR}

# clang
CLANG_MODULE="cde/v3/clang/12.0.1"
module load ${CLANG_MODULE}
CLANG_EXE_PATH=$(which clang)
CLANG_DIR=$(dirname ${CLANG_EXE_PATH})
spack compiler find ${CLANG_DIR}
source utilities/compilers/fix-clang-fortran.sh "${SIERRA_GCC_DIR}"
module unload ${CLANG_MODULE}

