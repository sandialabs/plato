#!/bin/bash

GCC_MODULE=aue/gcc/11.4.0 
module load $GCC_MODULE > /dev/null
GCC_EXE_PATH=$(which gcc)
GCC_DIR=$(dirname $GCC_EXE_PATH)
module unload $GCC_MODULE > /dev/null
echo $GCC_DIR
