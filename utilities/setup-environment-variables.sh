#!/bin/bash

if [[ -d "utilities" ]]
then
    export SUPER_PLATO_ROOT=$(pwd)
    export SPACK_DISABLE_LOCAL_CONFIG=true

    mkdir -p "${SUPER_PLATO_ROOT}/cache"
    export SPACK_USER_CACHE_PATH="${SUPER_PLATO_ROOT}/cache"

else
    echo "Can't find utilities directory. This script must be run from the plato super project directory."
fi
