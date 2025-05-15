#!/bin/bash

SHORT_USER=$(echo $USER | cut -b 1-7)
RUN_COUNT=$(ps aux | grep [s]sh-agent | grep -v run-ssh-agent | grep ${SHORT_USER} | wc -l)
echo "Found $RUN_COUNT ssh-agent procs for user $SHORT_USER"
if [ $RUN_COUNT -lt 1 ] ; then
  echo "Starting ssh-agent"
  eval `ssh-agent`
else
  echo "ssh-agent is running"
fi
