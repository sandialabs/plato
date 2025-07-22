#!/bin/bash
spack add platoanalyze@develop%clang~amgx~cuda+tacho+enginemesh build_type=RelWithDebInfo ${SYSTEM_ARCH} \
  ^openmpi@4.1.6 \
  ^platoengine@develop%clang+esp+expy+iso+platoproxy+prune+stk+unit_testing build_type=RelWithDebInfo

