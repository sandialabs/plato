#!/bin/bash

# Replace clang f77 and fc with gnu's
GCC_BASE_PATH=${1}
GFORTRAN_PATH=$(find ${GCC_BASE_PATH} -name gfortran)
GFORTRAN_F77="f77: ${GFORTRAN_PATH}"
GFORTRAN_FC="fc: ${GFORTRAN_PATH}"
sed -i "s|f77: null|$GFORTRAN_F77|" spack.yaml
sed -i "s|fc: null|$GFORTRAN_FC|" spack.yaml
