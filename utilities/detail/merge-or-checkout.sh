#!/bin/bash

TRIGGER_BRANCH=${1}
TRIGGER_SOURCE=${2}
if [[ "$TRIGGER_SOURCE" == "merge_request_event" ]]
then
    echo "Merging branch ${TRIGGER_BRANCH} with develop"
    source utilities/merge-with-develop.sh ${TRIGGER_BRANCH}
else
    echo "Checking out branch ${TRIGGER_BRANCH}"
    source utilities/checkout-branch.sh ${TRIGGER_BRANCH}
fi
