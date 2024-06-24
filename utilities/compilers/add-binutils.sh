#!/bin/bash

# Add binutils module
MODULE_NAME=aue/binutils
sed -i "s|modules: \[\]|modules: \[${MODULE_NAME}\]|" spack.yaml
