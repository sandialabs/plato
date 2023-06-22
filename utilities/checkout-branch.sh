#!/bin/bash

if [[ -d "utilities" ]]
then
  # Checkout main develop branches first
  source utilities/checkout-develop.sh
  # Checkout requested branch, if it fails, we'll remain on the main branch
  git submodule foreach ../utilities/detail/checkout-branch-if-exists.sh ${1}
else
  echo "Can't find utilities directory. This script must be run from super-plato."
fi

