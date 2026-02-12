#!/bin/bash

source utilities/build-env.sh ${CONFIGURATION}

# Make sure package was installed, if not there was a build error
if [[ "$BUILD_TYPE" != "dependencies" ]]; then spack find "${BUILD_TYPE}"; fi

# Uninstall PE for the dependencies build so it doesn't get copied to the spack/opt/spack cache.
if [[ "$BUILD_TYPE" == "dependencies" ]]; then spack uninstall -ayfR platoengine; fi
