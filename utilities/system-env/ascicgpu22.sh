#!/bin/bash

module purge
module load aue/git/2.42.0
module load aue/git-lfs/3.3.0
module load ccache

export RUNNER_HOME="${HOME}/.jacamar-ci/"
export NVCC_WRAPPER_TMPDIR=${CUSTOM_CI_BUILDS_DIR}/tmp
echo "Setting nvcc tmp dir to ${NVCC_WRAPPER_TMPDIR}"
