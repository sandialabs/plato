#!/bin/bash

if [[ -d "utilities" ]]
then
  # Set up spack.yaml for configuration
  cp utilities/spack/spack-${1}.yaml.in spack.yaml
  CUDA_ARCH=${2}
  sed -i "s/CUDA_ARCH_TOKEN/${CUDA_ARCH}/g" spack.yaml
  cat utilities/spack/spack-dev-paths.yaml.in >> spack.yaml
  SUPER_DIR=$(pwd)
  echo "Setting up spack env at path $SUPER_DIR"
  sed -i "s|SUPER_PATH_TOKEN|${SUPER_DIR}|g" spack.yaml

  source spack/share/spack/setup-env.sh
  spack env create -d .
  spack env activate .
else
  echo "Can't find utilities directory. This script must be run from super-plato."
fi
