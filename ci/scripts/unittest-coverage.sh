#!/bin/bash

source utilities/test-env.sh ${APPLICATION}
BUILD_DIR=$(spack location -b platoengine)
pushd ${BUILD_DIR}/functional/plato
ctest
popd
cd ${COV_REPORT_DIR}
SOURCE_DIR=$(spack location -c platoengine)
spack load py-gcovr
gcovr -j16 --root ${SOURCE_DIR} \
      --gcov-executable gcov \
      --decisions \
      --cobertura ${COV_COBERTURA_PATH} \
      --html-details coverage.html \
      --print-summary \
      --exclude-unreachable-branches \
      --exclude '.*unittest.*' \
      --exclude '.*test_utilities.*' \
      --exclude '.*integration_tests.*' \
      ${BUILD_DIR}/functional/plato
