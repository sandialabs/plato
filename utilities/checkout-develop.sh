#!/bin/bash

if [[ -d "utilities" ]]
then
  ./utilities/plato-submodule-foreach.sh ../utilities/detail/checkout-default-branch.sh
else
  echo "Can't find utilities directory. This script must be run from super-plato."
fi
