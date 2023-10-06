#!/bin/bash

RUN_COUNT=$(ps aux | grep [s]sh-agent | grep -v run-ssh-agent | grep gitlab | wc -l)
echo "Found $RUN_COUNT ssh-agent procs"
if [ $RUN_COUNT -lt 1 ] ; then
  echo "Starting ssh-agent"
  eval `ssh-agent`
else
  echo "ssh-agent is running"
fi

