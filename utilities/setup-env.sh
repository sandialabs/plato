#!/bin/bash

if [[ -d "utilities" ]]
then
  SUPER_DIR=$(pwd)
  echo "Setting up spack env at path $SUPER_DIR"

  source spack/share/spack/setup-env.sh
  spack env create --without-view -d .
  spack env activate .
  spack repo add plato-spack-repo/plato

  # Set up spack.yaml for configuration
  CUDA_ARCH=${2}
  source ./utilities/spack/spack-${1}.yaml.in

  spack develop -p ${SUPER_DIR}/platoengine platoengine@develop
  spack develop -p ${SUPER_DIR}/platoanalyze platoanalyze@develop
  if [[ -d "plato-prebuilt-binaries" ]]
  then
    spack mirror add ci-mirror ${SUPER_DIR}/plato-prebuilt-binaries/ci-dependency-mirror
  fi
else
  echo "Can't find utilities directory. This script must be run from the plato super project directory."
fi
