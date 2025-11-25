#!/bin/bash

COMPILER_MODULE=${1}
COMPILER_EXE=${2}

module load ${COMPILER_MODULE} >& /dev/null
EXE_PATH=$(which ${COMPILER_EXE})
EXE_DIR=$(dirname $EXE_PATH)
module unload ${COMPILER_MODULE} >& /dev/null

echo ${EXE_DIR}
