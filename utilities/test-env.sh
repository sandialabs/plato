#!/bin/bash

if [[ -d "spack" ]]
then
  export SUPER_PLATO_ROOT=$(pwd)

  source spack/share/spack/setup-env.sh
  spack env activate .
  spack load cmake
  spack load platoengine

  if [[ "$#" -eq 1 ]]
  then
    APP_NAME=$1
  else
    APP_NAME="platoanalyze"
  fi
  spack load ${APP_NAME}

  source utilities/sanitizer-env.sh ${SUPER_PLATO_ROOT}/ci/detail/sanitizer_black_list.txt
  source utilities/setup-ccache-on-ceelan.sh
else
  echo "Can't find spack directory. This script must be run from the plato super project directory."
fi
