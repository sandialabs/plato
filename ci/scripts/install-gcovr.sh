#!/bin/bash

source utilities/build-env.sh 
spack concretize
spack install py-gcovr
