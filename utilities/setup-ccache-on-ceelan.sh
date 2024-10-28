#!/bin/bash

CEELAN_CCACHE_DIR=/projects/plato/automated-builds/ccache
if [ -d "$CEELAN_CCACHE_DIR" ]; then
  CCACHE_DIR_GROUP=$(stat -c "%G" $CEELAN_CCACHE_DIR)
  id -nG "$USER" | grep -qw "$CCACHE_DIR_GROUP"
  USER_IN_PROJECTS_GROUP=$?
  if [ "$USER_IN_PROJECTS_GROUP" = "0" ]; then
    export CCACHE_DIR=${CEELAN_CCACHE_DIR}
    echo "Setting ccache dir to ${CCACHE_DIR}"
  fi
fi
