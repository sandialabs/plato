#!/bin/bash

if [[ -d "utilities" ]]
then
  CONFIGURATION=${1}
  CUDA_ARCH=${2}
  source utilities/setup-env.sh ${CONFIGURATION} ${CUDA_ARCH}
  SIERRA_GCC_DIR=$(utilities/sierra-gcc-dir.sh)
  spack compiler find "${SIERRA_GCC_DIR}"
  if [[ -d /projects/plato/automated-builds/${CONFIGURATION} ]]
  then
    source utilities/chain-installation.sh /projects/plato/automated-builds/${CONFIGURATION}/plato
  else
    echo "Could not find cee-lan installation at /projects/plato/automated-builds/${CONFIGURATION}"
    echo "Available installations are:"
    ls /projects/plato/automated-builds/ | grep -v spack-mirror
  fi
else
  echo "Can't find utilities directory. This script must be run from the plato super project directory."
fi
