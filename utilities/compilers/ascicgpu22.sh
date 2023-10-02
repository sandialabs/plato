#!/bin/bash
SIERRA_GCC_DIR=$(./utilities/sierra-gcc-dir.sh)
spack compiler find ${SIERRA_GCC_DIR}
