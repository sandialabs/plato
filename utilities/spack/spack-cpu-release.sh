#!/bin/bash

spack add platoanalyze@develop~amgx~cuda+tacho+suitesparse+integration_tests+openmp ${SYSTEM_ARCH} \
  ^platoengine@develop~esp+regression+sierra_tests+unit_testing+snopt+cubit+python \
  ^openmpi@4.1.6+pmi+internal-pmix+legacylaunchers ^openblas threads=openmp \
  ^zstd build_system=cmake
