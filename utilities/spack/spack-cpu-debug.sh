#!/bin/bash

spack add platoanalyze@develop~amgx~cuda+tacho+enginemesh+esp+mpmd+python build_type=Debug ${SYSTEM_ARCH} \
  ^openmpi@4.1.6 \
  ^platoengine@develop+esp+expy+iso+platoproxy+prune+stk+unit_testing build_type=Debug
