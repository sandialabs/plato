#!/bin/bash

module purge
module load aue/git
module load aue/git-lfs
module load ccache

export RUNNER_HOME="/scratch/${USER}/.jacamar-ci/"
