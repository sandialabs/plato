#!/bin/bash

source utilities/spack/check-cuda-arch.sh

spack add platoanalyze@develop+amgx+cuda+enginemesh+verificationtests+tacho+integration_tests ${SYSTEM_ARCH} \
  ^amgx cuda_arch=${CUDA_ARCH} \
  ^platoengine@develop~esp+regression+sierra_tests+unit_testing \
  ^openmpi@4.1.6 \
  ^trilinos cuda_arch=${CUDA_ARCH} 
