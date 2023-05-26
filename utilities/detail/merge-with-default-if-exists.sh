#!/bin/bash

source ../utilities/detail/checkout-default-branch.sh

BRANCH=${1}
git ls-remote --exit-code --heads origin "${BRANCH}"
BRANCH_EXISTS=$?
if [[ ${BRANCH_EXISTS} == 0 ]]
then
    echo "Merging ${BRANCH} with default"
    git fetch origin "${BRANCH}" 
    git merge "${BRANCH}"
else
    echo "Did not find ${BRANCH} on remote, not merging"
fi
