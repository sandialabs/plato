#!/bin/bash

spack add platoanalyze@develop~amgx~cuda+dakota_tests+enginemesh+esp+mpmd+tacho ${SYSTEM_ARCH} \
  ^dakota cxxflags="-fno-new-ttp-matching" fflags="-fallow-argument-mismatch" \
  ^openmpi@4.1.6 \
  ^platoengine@develop+dakota+esp~expy+sierra_tests \
  ^trilinos~mumps~stk~krino
