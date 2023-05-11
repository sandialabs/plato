#!/bin/bash

source ../utilities/detail/checkout-default-branch.sh

BRANCH=${1}
git show-ref --verify --quiet refs/heads/${BRANCH}
BRANCH_EXISTS=$?
if [[ ${BRANCH_EXISTS} == 0 ]]
then
    echo "Merging ${BRANCH} with default"
    git pull origin "${BRANCH}" --recurse-submodules
fi
