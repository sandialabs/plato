#!/bin/bash

export CONFIGURATION="cpu"
export SYSTEM="cee-build033"
export EXECUTOR=""
export GPU_ARCHITECTURE="70"
export RUN_COVERAGE_UNIT_TESTS="false"
export SETUP_SCRIPT="utilities/setup-env.sh"
export CI_TOOLCHAIN_IMAGE="cee-gitlab.sandia.gov:4567/1540-compsim/plato/plato/ci-toolchain"
export CI_PROJECT_DIR=$(pwd)
