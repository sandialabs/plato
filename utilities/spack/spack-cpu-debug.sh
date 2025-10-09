#!/bin/bash

spack add platoanalyze@develop~amgx~cuda+tacho+enginemesh build_type=Debug ${SYSTEM_ARCH} \
  ^platoengine@develop+esp+unit_testing build_type=Debug \
  ^openmpi@4.1.6 
