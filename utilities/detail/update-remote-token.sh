#!/bin/bash

CI_TOKEN=${1}
REMOTE_URL=$(git config --get remote.origin.url)
REPO_NAME=$(basename -s .git ${REMOTE_URL})
REMOTE_URL="https://gitlab-ci-token:${CI_TOKEN}@cee-gitlab.sandia.gov/1540-compsim/plato/${REPO_NAME}.git"
echo "Setting remote URL to ${REMOTE_URL}"
git remote set-url origin ${REMOTE_URL}
