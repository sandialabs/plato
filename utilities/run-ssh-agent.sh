#!/bin/bash

# Check if ssh-agent is running for gitlab-runner user
RUN_COUNT=$(ps aux | grep ssh-agent | grep gitlab | wc -l)
if [ $RUN_COUNT -lt 2 ] ; then
  echo "Starting ssh-agent"
  ssh-agent
else
  echo "ssh-agent is running"
fi

