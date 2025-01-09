#!/bin/bash

spack add kcov
spack concretize -f
spack install kcov
