#!/bin/bash

pushd platoengine
git checkout develop
git pull
git submodule update --init --recursive
popd

pushd platoanalyze
git checkout develop
git pull
git submodule update --init --recursive
popd

pushd spack
git checkout plato
git pull
popd

