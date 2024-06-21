#!/bin/bash

module load aue/gcc/11.4.0 > /dev/null
GCC_EXE_PATH=$(which gcc)
GCC_DIR=$(dirname $GCC_EXE_PATH)
module unload aue/gcc/11.4.0 > /dev/null
echo $GCC_DIR
