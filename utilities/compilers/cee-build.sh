#!/bin/bash

# gcc
GCC_MODULE="aue/gcc/11.4.0"
./utilities/compilers/add-compiler.sh ${GCC_MODULE} gcc
./utilities/compilers/add-module.py gcc ${GCC_MODULE}

# clang
CLANG_MODULE="aue/clang/16.0.6"
./utilities/compilers/add-compiler.sh ${CLANG_MODULE} clang
GCC_DIR=$(./utilities/compilers/compiler-dir.sh ${GCC_MODULE} gcc)
GCC_BASE_DIR=$(dirname $GCC_DIR)
CLANG_GFORTRAN_FLAGS="-fPIC"
./utilities/compilers/fix-clang-fortran.py "${GCC_BASE_DIR}" "${CLANG_GFORTRAN_FLAGS}"
./utilities/compilers/add-module.py clang ${GCC_MODULE} ${CLANG_MODULE}

# llvm, for clang-tidy
./utilities/compilers/find-external-package-from-module.sh ${CLANG_MODULE} clang llvm

# cuda
CUDA_MODULE="aue/cuda/11.8.0-gcc-10.3.0"
./utilities/compilers/find-external-package-from-module.sh ${CUDA_MODULE} nvcc cuda

