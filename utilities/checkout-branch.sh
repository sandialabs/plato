#!/bin/bash


if [[ -d "utilities" ]]
then
  # Checkout main develop branches first
  source utilities/checkout-develop.sh
  # Checkout requested branch, if it fails, we'll remain on the main branch
  ./utilities/plato-submodule-foreach.sh "../utilities/detail/checkout-branch-if-exists.sh ${1}"
  # Display branches
  source utilities/detail/colors.sh
  echo -e "\n${GREEN}Submodules are on the following branches:${NC}"
  ./utilities/plato-submodule-foreach.sh "git branch --show-current"
else
  echo "Can't find utilities directory. This script must be run from super-plato."
fi

