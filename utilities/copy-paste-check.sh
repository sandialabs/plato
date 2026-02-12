#!/bin/bash

CPD_OPTIONS='--language cpp --no-fail-on-error'
RUN_DIR="$1"
TOKENS="$2"
CHECK_DIR="$3"
EXCLUDE_STRING=" --exclude ${4}"

if [[ -z "$4" ]]; then
  EXCLUDE_STRING=""
fi

${RUN_DIR}/pmd cpd ${CPD_OPTIONS} --minimum-tokens=${TOKENS} ${CHECK_DIR} ${EXCLUDE_STRING}
