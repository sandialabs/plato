#!/bin/bash

BRANCH=${1}
git ls-remote --exit-code --heads origin "${BRANCH}"
BRANCH_EXISTS=$?
if [[ ${BRANCH_EXISTS} == 0 ]]
then
    git fetch origin
    git branch -v -a
    echo "Fetching ${BRANCH}"
    git fetch origin ${BRANCH}
    git branch -v -a
    git config --get remote.origin.fetch
    echo "Checking out ${BRANCH}"
    git switch ${BRANCH}
    echo "Pulling ${BRANCH}"
    git pull --recurse-submodules
fi
