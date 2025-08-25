#!/bin/bash

spack add platoanalyze@develop~amgx~cuda+tacho+enginemesh+integration_tests ${SYSTEM_ARCH} \
  ^openmpi@4.1.6 \
  ^platoengine@develop+esp+regression+sierra_tests+unit_testing
