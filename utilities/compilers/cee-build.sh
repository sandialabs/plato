#!/bin/bash

# gcc
GCC_MODULE="aue/gcc/11.4.0"
./utilities/compilers/add-compiler.sh ${GCC_MODULE} gcc

# clang
CLANG_MODULE="aue/clang/16.0.6"
./utilities/compilers/add-compiler.sh ${CLANG_MODULE} clang

GCC_DIR=$(./utilities/compilers/compiler-dir.sh ${GCC_MODULE} gcc)
./utilities/compilers/fix-clang-fortran.sh "${GCC_DIR}"

./utilities/compilers/find-external-package-from-module.sh ${CLANG_MODULE} clang llvm

./utilities/compilers/add-module.sh ${GCC_MODULE}

# cuda
CUDA_MODULE="aue/cuda/11.8.0-gcc-10.3.0"
./utilities/compilers/find-external-package-from-module.sh ${CUDA_MODULE} nvcc cuda

