#!/bin/bash

MAIN_BRANCH=$(git remote show origin | grep 'HEAD branch' | cut -d' ' -f5)
echo "Main branch: ${MAIN_BRANCH}"
git checkout ${MAIN_BRANCH}
git reset --hard origin/${MAIN_BRANCH}
git pull --recurse-submodules
