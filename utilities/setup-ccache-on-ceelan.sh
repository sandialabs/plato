#!/bin/bash

CEELAN_CCACHE_DIR=/projects/plato/automated-builds/ccache
if [ -d "$CEELAN_CCACHE_DIR" ]; then
  export CCACHE_DIR=${CEELAN_CCACHE_DIR}
  echo "Setting ccache dir to ${CCACHE_DIR}"
fi
