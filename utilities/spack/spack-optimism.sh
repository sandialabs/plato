#!/bin/bash

spack add platopythonapp@main%clang+optimism ${SYSTEM_ARCH} \
  ^platoengine@develop%clang+esp~expy~iso~platoproxy~prune+stk~unit_testing
  ^openmpi@4.1.3 \
  ^trilinos~mumps

