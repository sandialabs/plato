#!/bin/bash

BRANCH=${1}
git show-ref --verify --quiet refs/heads/${BRANCH}
branch_exists=$?
if [[ ${BRANCH_EXISTS} == 0 ]]
then
    git checkout ${BRANCH}
    git pull --recurse-submodules
fi
