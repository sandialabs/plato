#!/bin/bash
spack add platoanalyze@develop~amgx~cuda+tacho+suitesparse build_type=RelWithDebInfo ${SYSTEM_ARCH} \
  ^platoengine@develop~esp+unit_testing build_type=RelWithDebInfo \
  ^openmpi@4.1.6 \
  ^zstd build_system=cmake
