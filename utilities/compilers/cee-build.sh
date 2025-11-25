#!/bin/bash

GCC_MODULE="aue/gcc/14.2.0"
BINUTILS_MODULE="aue/binutils/2.43.1"
CLANG_MODULE="aue/clang/18.1.8"
CUDA_11_MODULE="aue/cuda/11.8.0-gcc-10.3.0"
CUDA_12_MODULE="aue/cuda/12.4.0-gcc-12.3.0"
CUDA_GCC_MODULE="aue/gcc/12.3.0" # until aue has cuda with gcc 14 support
GFORTRAN_FLAGS="-fPIC"

add_gcc() {
    local GCC_MODULE_NAME=$1
    ./utilities/compilers/add-compiler.sh ${GCC_MODULE_NAME} gcc
    ./utilities/compilers/add-module.py gcc ${GCC_MODULE_NAME} ${BINUTILS_MODULE}
}

add_clang_with_gfortran() {
    ./utilities/compilers/add-compiler.sh ${CLANG_MODULE} clang
    GCC_DIR=$(./utilities/compilers/compiler-dir.sh ${GCC_MODULE} gcc)
    GCC_BASE_DIR=$(dirname $GCC_DIR)
    ./utilities/compilers/fix-clang-fortran.py "${GCC_BASE_DIR}" "${GFORTRAN_FLAGS}"
    ./utilities/compilers/add-module.py llvm ${GCC_MODULE} ${CLANG_MODULE} ${BINUTILS_MODULE}
}

add_cuda() {
    ./utilities/compilers/find-external-package-from-module.sh $CUDA_11_MODULE nvcc cuda
    ./utilities/compilers/find-external-package-from-module.sh $CUDA_12_MODULE nvcc cuda
}

echo "Adding clang compiler from ${CLANG_MODULE} with gfortran from module ${GCC_MODULE}"
add_clang_with_gfortran
echo "Adding gcc compiler from module ${GCC_MODULE}"
add_gcc ${GCC_MODULE}
