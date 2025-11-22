#!/bin/bash

source utilities/spack/check-cuda-arch.sh

spack add platoanalyze@develop+all_penalty+amgx+cuda+enginemesh+hex_elements+integration_tests+tacho+tpetra+verificationtests ${SYSTEM_ARCH} \
  ^amgx cuda_arch=${CUDA_ARCH} ^trilinos cuda_arch=${CUDA_ARCH} ^platoengine@develop+esp+regression+sierra_tests+unit_testing \
  ^openmpi@4.1.6 
  
