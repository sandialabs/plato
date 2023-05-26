#!/bin/bash

BRANCH=${1}
git ls-remote --exit-code --heads origin "${BRANCH}"
branch_exists=$?
if [[ ${BRANCH_EXISTS} == 0 ]]
then
    git checkout ${BRANCH}
    git pull --recurse-submodules
fi
