#!/bin/bash

BRANCH=${1}
git ls-remote --exit-code --heads origin "${BRANCH}"
BRANCH_EXISTS=$?
if [[ ${BRANCH_EXISTS} == 0 ]]
then
    git fetch origin
    git branch -v -a
    echo "Checking out ${BRANCH}"
    git switch -c ${BRANCH}
    echo "Pulling ${BRANCH}"
    git pull --recurse-submodules
fi
