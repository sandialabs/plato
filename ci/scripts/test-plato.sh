#!/bin/bash

source utilities/test-env.sh ${APPLICATION} || true
BUILD_DIR=$(spack location -b ${PLATO_NAME})
cd ${BUILD_DIR}
echo "Test Labels:"
echo "CTest Include Regex ${CTEST_INCLUDE_REGEX}"
echo "CTest Exclude Regex ${CTEST_EXCLUDE_REGEX}"
echo "Label Exclude ${CTEST_LABEL_EXCLUDE}"
ctest -R "${CTEST_INCLUDE_REGEX}" -E "${CTEST_EXCLUDE_REGEX}" -LE "${CTEST_LABEL_EXCLUDE}" --timeout "${TIMEOUT_IN_SEC}" -j"${CTEST_NUM_JOBS}" --output-junit ${GTEST_REPORT_NAME} || TEST_FAILED=true
cp ${GTEST_REPORT_NAME} ${CONTAINER_WORKSPACE_DIR}/${REPORTS_ARTIFACTS_DIR}/
cp ${CTEST_LOG} ${CONTAINER_WORKSPACE_DIR}/${REPORTS_ARTIFACTS_DIR}/ 
if [[ "${TEST_FAILED}" == "true" ]]; then (exit 1); fi # Fail if ctest failed
