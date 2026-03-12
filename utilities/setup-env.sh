#!/bin/bash

if [[ -d "utilities" ]]
then
  source utilities/setup-environment-variables.sh
  source utilities/parse-options.sh
  parse_setup_options "$@"

  SUPER_DIR=$(pwd)
  echo "Setting up spack env at path $SUPER_DIR"

  source spack/share/spack/setup-env.sh
  spack env create --without-view -d .
  spack env activate .
  spack repo add plato-spack-repo/plato

  # Set up spack.yaml for configuration
  source ./utilities/spack/spack-${CONFIGURATION}.sh

  spack develop -p ${SUPER_DIR}/platoengine -b ${SUPER_DIR}/build/platoengine platoengine@develop
  spack develop -p ${SUPER_DIR}/platoanalyze -b ${SUPER_DIR}/build/platoanalyze platoanalyze@develop
  spack mirror add ci-mirror ${SUPER_DIR}/plato-prebuilt-binaries/ci-dependency-mirror

  spack config add config:connect_timeout:300

  git config --file .git/modules/platoengine/config core.hooksPath ${SUPER_DIR}/utilities/git-hooks
  git config --file .git/modules/platoanalyze/config core.hooksPath ${SUPER_DIR}/utilities/git-hooks
  
  source ./utilities/compilers/setup-toolchain.sh ${CONFIGURATION}
 
else
  echo "Can't find utilities directory. This script must be run from the plato super project directory."
fi
