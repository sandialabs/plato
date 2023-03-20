#!/bin/bash

UPSTREAM_DIR=${1}
sed  "s|UPSTREAM_PATH_TOKEN|${UPSTREAM_DIR}|g" utilities/upstreams.yaml.in > spack/etc/spack/upstreams.yaml

