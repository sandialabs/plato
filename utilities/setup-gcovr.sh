#!/bin/bash

RUN_COVERAGE="${1^^}"
if [[ "$RUN_COVERAGE" == "TRUE" ]]; then
  spack add py-gcovr ^python@:3.14.2
fi
