#!/bin/bash

if [[ -d "spack" ]]
then
  source utilities/setup-environment-variables.sh
  source spack/share/spack/setup-env.sh
  spack env activate .
  source utilities/setup-ccache-on-ceelan.sh
else
  echo "Can't find spack directory. This script must be run from the plato super project directory."
fi
