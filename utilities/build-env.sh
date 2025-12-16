#!/bin/bash

WORKING_SCRIPT_DIR="$(dirname ${BASH_SOURCE[0]})"
export SUPER_PLATO_ROOT=$(realpath ${WORKING_SCRIPT_DIR}/../)
echo "Plato environment: $SUPER_PLATO_ROOT"

if [[ -d "${SUPER_PLATO_ROOT}/spack" ]]
then
  source ${SUPER_PLATO_ROOT}/utilities/setup-environment-variables.sh
  source ${SUPER_PLATO_ROOT}/spack/share/spack/setup-env.sh
  spack env activate ${SUPER_PLATO_ROOT}
  source ${SUPER_PLATO_ROOT}/utilities/setup-ccache-on-ceelan.sh
else
  echo "Can't find spack directory. Ensure all submodules are fully cloned."
fi
