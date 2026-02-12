#!/bin/bash

source ${SETUP_SCRIPT} -c ${CONFIGURATION} -g ${GPU_ARCHITECTURE}
./utilities/setup-gcovr.sh ${RUN_COVERAGE_UNIT_TESTS}
source utilities/compilers/ubuntu.sh ${CONFIGURATION} # System-specific compiler set up
source utilities/compilers/setup-toolchain.sh ${CONFIGURATION}
spack clean -m
