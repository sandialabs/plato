#!/bin/bash

MODULE_NAME=${1}
EXE_ON_PATH=${2}
SPACK_PACKAGE=${3}

module load ${MODULE_NAME}
EXE_PATH=$(which ${EXE_ON_PATH})
EXE_DIR=$(dirname ${EXE_PATH})
spack external find --not-buildable --scope env:$(pwd -P) --path ${EXE_DIR} ${SPACK_PACKAGE}
module unload ${MODULE_NAME}
