#!/bin/bash

if [[ -d "utilities" ]]
then
  ./utilities/plato-submodule-foreach.sh "../utilities/detail/merge-with-default-if-exists.sh ${1}"
else
  echo "Can't find utilities directory. This script must be run from the plato super project directory."
fi
