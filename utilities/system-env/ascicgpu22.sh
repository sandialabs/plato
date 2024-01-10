#!/bin/bash

module purge
module load cde/v3/git
module load cde/v3/git-lfs
module load ccache

export RUNNER_HOME="/scratch/1540-runners/${GITLAB_USER_LOGIN}"
