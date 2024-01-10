#!/bin/bash

if [[ -d "utilities" ]]
then
 ./utilities/plato-submodule-foreach.sh "git checkout -b ${1}"
else
  echo "Can't find utilities directory. This script must be run from super-plato."
fi
