#!/bin/bash
ARCH_ARG=${1}
spack add platoanalyze@develop%clang~amgx~cuda+tacho+enginemesh+esp+mpmd+python+dev_build build_type=Debug ${SYSTEM_ARCH} \
  ^openmpi@4.1.6 \
  ^platoengine@develop%clang+esp+expy+iso+platoproxy+prune+stk+unit_testing+dev_build build_type=Debug

