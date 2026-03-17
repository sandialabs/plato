#!/bin/bash

RUN_COVERAGE="${1^^}"
if [[ "$RUN_COVERAGE" == "TRUE" ]]; then
  spack add py-gcovr ^py-lxml cflags="-Wno-incompatible-pointer-types"
fi
