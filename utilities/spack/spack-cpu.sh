#!/bin/bash

spack add platoanalyze@develop~amgx~cuda+tacho+enginemesh+esp+mpmd+python+integration_tests ${SYSTEM_ARCH} \
  ^openmpi@4.1.3 \
  ^platoengine@develop+esp+expy+iso+platoproxy+prune+regression+services+sierra_tests+stk+unit_testing
