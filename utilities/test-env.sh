#!/bin/bash

if [[ -d "spack" ]]
then
  source spack/share/spack/setup-env.sh
  spack env activate .
  spack load cmake
  spack load platoengine
  spack load platoanalyze
else
  echo "Can't find spack directory. This script must be run from super-plato."
fi
