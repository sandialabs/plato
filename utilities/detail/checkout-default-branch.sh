#!/bin/bash

MAIN_BRANCH=$(git remote show origin | grep 'HEAD branch' | cut -d' ' -f5)
git checkout ${MAIN_BRANCH} 
git pull --recurse-submodules
