#!/bin/bash

if [[ -d "utilities" ]]
then
  CEE_LAN_ARCH=$(./utilities/spack/cee-lan-arch.sh)
  source utilities/setup-env.sh "$@" -a ${CEE_LAN_ARCH}
  source utilities/compilers/cee-build.sh
  if [[ -d /projects/plato/automated-builds/${CONFIGURATION} ]]
  then
    source utilities/chain-installation.sh /projects/plato/automated-builds/${CONFIGURATION}/plato
  else
    echo "Could not find cee-lan installation at /projects/plato/automated-builds/${CONFIGURATION}"
    echo "Available installations are:"
    ls /projects/plato/automated-builds/ | grep -v spack-mirror
  fi
  mkdir -p .vscode
  cp utilities/vscode/tasks.json .vscode
else
  echo "Can't find utilities directory. This script must be run from the plato super project directory."
fi
