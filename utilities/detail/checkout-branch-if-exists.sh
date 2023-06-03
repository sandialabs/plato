#!/bin/bash

BRANCH=${1}
git ls-remote --exit-code --heads origin "${BRANCH}"
BRANCH_EXISTS=$?
if [[ ${BRANCH_EXISTS} == 0 ]]
then
    git fetch origin
    git checkout ${BRANCH}
    git pull --recurse-submodules
fi
