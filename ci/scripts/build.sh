#!/bin/bash

source utilities/build-env.sh ${CONFIGURATION}
spack clean -m
spack concretize
spack install ${SPACK_INSTALL_ARGS} || true

# Copy build log
if [[ "$BUILD_TYPE" == "dependencies" ]]
then
    mkdir "$BUILD_TYPE" && cp platoengine/build-*/spack-build-out.txt "$BUILD_TYPE"
else
    cp ${BUILD_TYPE}/build-*/spack-build-out.txt "$BUILD_TYPE"
fi
