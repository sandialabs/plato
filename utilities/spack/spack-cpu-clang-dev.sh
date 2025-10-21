#!/bin/bash

spack add platoanalyze@develop~amgx~cuda+tacho+umfpack+enginemesh cmake_preset=dev_build build_type=Debug ${SYSTEM_ARCH} \
  ^platoengine@develop+esp+unit_testing cmake_preset=dev_build build_type=Debug \
  ^openmpi@4.1.6 
