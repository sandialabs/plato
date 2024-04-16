#!/bin/bash

if [[ -d "spack" ]]
then
  export SUPER_PLATO_ROOT=$(pwd)

  source spack/share/spack/setup-env.sh
  spack env activate .
  spack load cmake
  spack load platoengine
  spack load platoanalyze
  source utilities/sanitizer-env.sh ${SUPER_PLATO_ROOT}/ci/detail/sanitizer_black_list.txt
else
  echo "Can't find spack directory. This script must be run from the plato super project directory."
fi
