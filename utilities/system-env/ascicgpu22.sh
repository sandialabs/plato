#!/bin/bash

module purge
module load aue/git/2.42.0
module load aue/git-lfs/3.3.0
module load ccache


export RUNNER_HOME="${HOME}/.jacamar-ci/"
