#!/bin/bash

export PLATO_FOREACH_SCRIPT=${1}
submodule_args=${2}
git submodule foreach ${submodule_args} 'if ! ../utilities/excluded-submodules.sh | grep -Fxq "$name"; then ${PLATO_FOREACH_SCRIPT}; else echo "Excluded"; fi'
unset PLATO_FOREACH_SCRIPT
