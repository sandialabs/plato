#!/bin/bash

# Find clang
spack compiler find /usr/bin
source utilities/compilers/fix-clang-fortran.sh "/usr/bin"
spack external find --not-buildable --scope env:$(pwd -P) llvm