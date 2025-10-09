#!/bin/bash

if [[ -d "utilities" ]]
then
  ./utilities/compilers/add-toolchain.py clang_gfortran_toolchain llvm@18 gcc@14.2.0
  ./utilities/compilers/add-toolchain.py gcc_toolchain gcc@14.2.0 gcc@14.2.0
  #./utilities/compilers/add-toolchain.py cuda_toolchain gcc@12.3.0 gcc@12.3.0

  if [[ "${CONFIGURATION}" == *"clang"* ]]; then
    ./utilities/compilers/add-require-toolchain.py clang_gfortran_toolchain
  elif [[ "${CONFIGURATION}" == *"cpu"* ]]; then
    ./utilities/compilers/add-require-toolchain.py gcc_toolchain
  #elif [[ "${CONFIGURATION}" == *"gpu"* ]]; then
  #  ./utilities/compilers/add-require-toolchain.py cuda_toolchain
  else
    ./utilities/compilers/add-require-toolchain.py gcc_toolchain
  fi
  

else
  echo "Can't find utilities directory. This script must be run from the plato super project directory."
fi
