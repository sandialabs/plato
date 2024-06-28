#!/bin/bash

# Replace clang f77 and fc with gnu's
GCC_BASE_PATH=${1}
GFORTRAN_PATH=$(find ${GCC_BASE_PATH} -name gfortran)
GFORTRAN_F77="f77: ${GFORTRAN_PATH}"
GFORTRAN_FC="fc: ${GFORTRAN_PATH}"
sed -i "s|f77: null|$GFORTRAN_F77|" spack.yaml
sed -i "s|fc: null|$GFORTRAN_FC|" spack.yaml

# Add gcc rpath
CLANG_SPACK_BEGIN="spec: clang"
CLANG_SPACK_END="\(compiler:\|packages:\)"
GCC_LIB_PATH=$(realpath ${GCC_BASE_PATH}/../lib64)
GFORTRAN_RPATH="extra_rpaths: \[${GCC_LIB_PATH}\]"
sed -i "/${CLANG_SPACK_BEGIN}/,/${CLANG_SPACK_END}/ s|extra_rpaths: \[\]|${GFORTRAN_RPATH}|" spack.yaml

CLANG_GFORTRAN_FLAGS="flags: {fflags: -fPIC}"
sed -i "/${CLANG_SPACK_BEGIN}/,/${CLANG_SPACK_END}/ s|flags: {}|${CLANG_GFORTRAN_FLAGS}|" spack.yaml

