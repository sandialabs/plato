#!/bin/bash

UPSTREAM_DIR=${1}
sed  "s|UPSTREAM_PATH_TOKEN|${UPSTREAM_DIR}|g" utilities/spack/upstreams.yaml.in > spack/etc/spack/upstreams.yaml

