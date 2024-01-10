#!/bin/bash

if [[ -d "spack" ]]
then
  UPSTREAM_DIR=${1}
  sed  "s|UPSTREAM_PATH_TOKEN|${UPSTREAM_DIR}|g" utilities/spack/upstreams.yaml.in > spack/etc/spack/upstreams.yaml
else
  echo "Can't find spack directory. This script must be run from super-plato."
fi
