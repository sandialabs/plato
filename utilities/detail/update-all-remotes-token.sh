#!/bin/bash

UTILITIES_DIR=$(pwd)/utilities/detail
export PATH=${UTILITIES_DIR}:$PATH
CI_TOKEN=${1}
./utilities/plato-submodule-foreach.sh "update-remote-token.sh ${CI_TOKEN}" --recursive
