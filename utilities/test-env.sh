#!/bin/bash

WORKING_SCRIPT_DIR="$(dirname ${BASH_SOURCE[0]})"
source ${WORKING_SCRIPT_DIR}/setup-environment-variables.sh

if [[ -d "${SUPER_PLATO_ROOT}/spack" ]]
then
  source ${SUPER_PLATO_ROOT}/spack/share/spack/setup-env.sh
  spack env activate ${SUPER_PLATO_ROOT}
  spack load cmake
  spack load platoengine

  if [[ "$#" -eq 1 ]]
  then
    APP_NAME=$1
  else
    APP_NAME="platoanalyze"
  fi
  spack load ${APP_NAME}

  source ${SUPER_PLATO_ROOT}/utilities/sanitizer-env.sh ${SUPER_PLATO_ROOT}/ci/detail/sanitizer_black_list.txt
  source ${SUPER_PLATO_ROOT}/utilities/setup-ccache-on-ceelan.sh
  source ${SUPER_PLATO_ROOT}/utilities/plato-parallel.sh
else
  echo "Can't find spack directory. Ensure all submodules are fully cloned."
fi
