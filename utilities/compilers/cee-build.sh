#!/bin/bash

# gcc
GCC_DIR=$(./utilities/gcc-dir.sh)
spack compiler find ${GCC_DIR}

# clang
CLANG_MODULE="aue/clang/16.0.6"
module load ${CLANG_MODULE}
CLANG_EXE_PATH=$(which clang)
CLANG_DIR=$(dirname ${CLANG_EXE_PATH})

spack compiler find ${CLANG_DIR}
source utilities/compilers/fix-clang-fortran.sh "${GCC_DIR}"
spack external find --not-buildable --scope env:$(pwd -P) --path ${CLANG_DIR} llvm

module unload ${CLANG_MODULE}
