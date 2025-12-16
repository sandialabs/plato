#!/bin/bash

export SPACK_DISABLE_LOCAL_CONFIG=true

mkdir -p "${SUPER_PLATO_ROOT}/cache"
export SPACK_USER_CACHE_PATH="${SUPER_PLATO_ROOT}/cache"
