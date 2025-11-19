#!/bin/bash

module purge
module load aue/git
module load aue/git-lfs
module load ccache

export RUNNER_HOME="${HOME}/.jacamar-ci/"

export NVCC_WRAPPER_TMPDIR=${CUSTOM_CI_BUILDS_DIR}/tmp
echo "Setting nvcc tmp dir to ${NVCC_WRAPPER_TMPDIR}"
mkdir -p ${NVCC_WRAPPER_TMPDIR}
