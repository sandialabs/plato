#!/bin/bash

source ../utilities/detail/checkout-default-branch.sh
DEFAULT_BRANCH=$(git branch --show-current)

BRANCH=${1}
git ls-remote --exit-code --heads origin "${BRANCH}"
BRANCH_EXISTS=$?
if [[ ${BRANCH_EXISTS} == 0 ]]
then
    echo "Merging ${BRANCH} with default branch ${DEFAULT_BRANCH}"
    git fetch origin
    git checkout "${BRANCH}"
    git checkout "${DEFAULT_BRANCH}"
    git merge "${BRANCH}"
else
    echo "Did not find ${BRANCH} on remote, not merging"
fi
