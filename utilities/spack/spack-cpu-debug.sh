#!/bin/bash

spack add platoanalyze@develop~amgx~cuda+tacho+enginemesh build_type=Debug ${SYSTEM_ARCH} \
  ^openmpi@4.1.6 \
  ^platoengine@develop+esp+unit_testing build_type=Debug
