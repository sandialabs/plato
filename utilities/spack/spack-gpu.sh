#!/bin/bash

source utilities/spack/check-cuda-arch.sh

spack add platoanalyze@develop+all_penalty+amgx+cuda+enginemesh+hex_elements+integration_tests~micromorphic+tacho+tpetra+verificationtests ${SYSTEM_ARCH} \
  ^amgx cuda_arch=${CUDA_ARCH} \
  ^openmpi@4.1.6 \
  ^platoengine@develop+cuda+esp+regression+sierra_tests+unit_testing \
  ^trilinos cuda_arch=${CUDA_ARCH}
