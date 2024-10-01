#!/bin/bash

spack add platoanalyze@develop~amgx~cuda+enginemesh+esp+integration_tests+mpmd+python+tacho ${SYSTEM_ARCH} \
  ^trilinos~mumps \
  ^openmpi@4.1.3 \
  ^platoengine@develop+esp+expy+iso+platoproxy+prune+python_app+regression+services+sierra_tests+stk+unit_testing
