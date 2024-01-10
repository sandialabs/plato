#!/bin/bash

# Temporary fix for move of integration_tests

pushd platoengine
git rm --cached integration_tests/ || true
rm -rf integration_tests/
popd

pushd platoanalyze
git rm --cached integration_tests/ || true
rm -rf integration_tests/
popd
