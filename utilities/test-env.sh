#!/bin/bash

WORKING_SCRIPT_DIR="$(dirname "${BASH_SOURCE[0]}")"
source "${WORKING_SCRIPT_DIR}/run-env.sh" "$@"

if [[ -d "${SUPER_PLATO_ROOT}/spack" ]]
then
  spack load cmake
  source "${SUPER_PLATO_ROOT}/utilities/sanitizer-env.sh" "${SUPER_PLATO_ROOT}/ci/detail/sanitizer_black_list.txt"
  source "${SUPER_PLATO_ROOT}/utilities/setup-ccache-on-ceelan.sh"
else
  echo "Can't find spack directory. Ensure all submodules are fully cloned."
fi
