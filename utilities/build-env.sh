#!/bin/bash

if [[ -d "spack" ]]
then
  export SUPER_PLATO_ROOT=$(pwd)

  source spack/share/spack/setup-env.sh
  spack env activate .
else
  echo "Can't find spack directory. This script must be run from super-plato."
fi
