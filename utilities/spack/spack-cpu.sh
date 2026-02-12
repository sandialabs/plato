#!/bin/bash

spack add platoanalyze@develop~amgx~cuda+tacho+umfpack+enginemesh+integration_tests+openmp ${SYSTEM_ARCH} \
  ^platoengine@develop~esp+regression+sierra_tests+unit_testing \
  ^openmpi@4.1.6 ^openblas threads=openmp
