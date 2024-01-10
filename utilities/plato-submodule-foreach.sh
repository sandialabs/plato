#!/bin/bash

export PLATO_FOREACH_SCRIPT=${1}
submodule_args=${2}
git submodule foreach ${submodule_args} 'exclude=$(../utilities/excluded-submodules.sh); case $name in $exclude) echo "excluded" ;; *) ${PLATO_FOREACH_SCRIPT} ;; esac'
unset PLATO_FOREACH_SCRIPT
