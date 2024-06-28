#!/bin/bash

MODULE_NAME=${1}
sed -i "s|modules: \[\]|modules: \[${MODULE_NAME}\]|" spack.yaml
