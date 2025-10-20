#!/bin/bash

spack add platoanalyze@develop~amgx~cuda+tacho+enginemesh cmake_preset=dev_build build_type=Debug ${SYSTEM_ARCH} \
  ^platoengine@develop+esp+unit_testing+snopt cmake_preset=dev_build build_type=Debug \
  ^openmpi@4.1.6 
