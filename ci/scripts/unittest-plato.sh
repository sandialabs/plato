#!/bin/bash

source utilities/test-env.sh ${APPLICATION} || true
BUILD_DIR=$(spack location -b ${PLATO_NAME})
cd ${BUILD_DIR}
ctest -R UnitTest --output-junit ${CTEST_REPORT_FILE} || TEST_FAILED=true
find . -name "*UnitTester.xml" -exec cp "{}" ${CONTAINER_WORKSPACE_DIR}/${REPORTS_ARTIFACTS_DIR}/ \;
cp ${CTEST_LOG} ${CONTAINER_WORKSPACE_DIR}/${REPORTS_ARTIFACTS_DIR}/ 
if [[ "${TEST_FAILED}" == "true" ]]; then (exit 1); fi # Fail if ctest failed
