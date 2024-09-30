#!/bin/bash
ARCH_ARG=${1}
spack add platoanalyze@develop%clang~amgx~cuda+tacho+enginemesh+esp+mpmd+python+dev_build build_type=Debug ${SYSTEM_ARCH} \
  ^trilinos~mumps \
  ^openmpi@4.1.3 \
  ^platoengine@develop%clang+esp+expy+iso+platoproxy+prune~python_app+stk+unit_testing+dev_build build_type=Debug

