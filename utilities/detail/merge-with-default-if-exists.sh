#!/bin/bash

source ../utilities/detail/checkout-default-branch.sh

BRANCH=${1}
git ls-remote --exit-code --heads origin "${BRANCH}"
BRANCH_EXISTS=$?
if [[ ${BRANCH_EXISTS} == 0 ]]
then
    echo "Merging ${BRANCH} with default branch"
    git pull origin "${BRANCH}" --no-rebase --recurse-submodules --no-edit
else
    echo "Did not find ${BRANCH} on remote, not merging"
fi
