#!/bin/bash

UTILITIES_DIR=$(pwd)/utilities/detail
export PATH=${UTILITIES_DIR}:$PATH
CI_TOKEN=${1}
git submodule foreach --recursive update-remote-token.sh ${CI_TOKEN}
