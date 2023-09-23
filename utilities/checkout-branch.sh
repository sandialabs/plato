#!/bin/bash

green="\033[1;32m"
nc="\033[1;0m"

if [[ -d "utilities" ]]
then
  # Checkout main develop branches first
  source utilities/checkout-develop.sh
  # Checkout requested branch, if it fails, we'll remain on the main branch
  ./utilities/plato-submodule-foreach.sh "../utilities/detail/checkout-branch-if-exists.sh ${1}"
  echo -e "\n${green}Submodules are on the following branches:${nc}"
  ./utilities/plato-submodule-foreach.sh "git branch --show-current"
else
  echo "Can't find utilities directory. This script must be run from super-plato."
fi

