#!/bin/bash

WORKING_SCRIPT_DIR="$(dirname ${BASH_SOURCE[0]})"
export SUPER_PLATO_ROOT=$(realpath ${WORKING_SCRIPT_DIR}/../)
echo "Plato environment: $SUPER_PLATO_ROOT"

export SPACK_DISABLE_LOCAL_CONFIG=true

mkdir -p "${SUPER_PLATO_ROOT}/cache"
export SPACK_USER_CACHE_PATH="${SUPER_PLATO_ROOT}/cache"
