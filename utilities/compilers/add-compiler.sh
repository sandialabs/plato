#!/bin/bash

COMPILER_DIR=$(./utilities/compilers/compiler-dir.sh ${@})

spack compiler find ${COMPILER_DIR}

