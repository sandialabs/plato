#!/bin/bash

# Find clang
spack compiler find /usr/bin
./utilities/compilers/fix-clang-fortran.py "/usr" compilers_only
spack external find --not-buildable --scope env:$(pwd -P) llvm
