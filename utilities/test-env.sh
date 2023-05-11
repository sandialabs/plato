#!/bin/bash

source spack/share/spack/setup-env.sh
spack env activate .
spack load cmake
spack load platoengine
spack load platoanalyze
