#!/bin/bash

# Checkout main develop branches first
source utilities/checkout-develop.sh
# Checkout requested branch, if it fails, we'll remain on the main branch
git submodule foreach ../utilities/detail/checkout-branch-if-exists.sh ${1}
