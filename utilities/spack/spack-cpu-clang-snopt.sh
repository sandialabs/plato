#!/bin/bash

spack add platoanalyze@develop~amgx~cuda+tacho+enginemesh+dev_build build_type=Debug ${SYSTEM_ARCH} \
  ^platoengine@develop+esp+unit_testing+snopt+dev_build build_type=Debug \
  ^openmpi@4.1.6 
