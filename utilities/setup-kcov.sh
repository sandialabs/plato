#!/bin/bash

RUN_COVERAGE="$1"
if [[ "$RUN_COVERAGE" == "TRUE" ]]; then
  spack add kcov
fi

