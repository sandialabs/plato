#!/bin/bash

BRANCH=${1}
git ls-remote --exit-code --heads origin "${BRANCH}"
BRANCH_EXISTS=$?
if [[ ${BRANCH_EXISTS} == 0 ]]
then
    echo "Switching to ${BRANCH}"
    # Gitlab CI is set to only fetch the default branch
    # So we have to switch it to fetch all branches
    REMOTE_ORIGIN_FETCH=$(git config --get remote.origin.fetch)
    echo "Switching remote.origin.fetch from ${REMOTE_ORIGIN_FETCH}"
    git config remote.origin.fetch "+refs/heads/*:refs/remotes/origin/*"

    git fetch origin
    git switch ${BRANCH}
    git pull --recurse-submodules

    echo "Restoring remote.origin.fetch ${REMOTE_ORIGIN_FETCH}"
    git config remote.origin.fetch ${REMOTE_ORIGIN_FETCH}
    git config --get remote.origin.fetch
fi
