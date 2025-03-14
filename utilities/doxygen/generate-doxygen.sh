#!/bin/bash

if [[ ! -d "utilities" ]]
then
  echo "Can't find utilities directory. This script must be run from the plato super project directory."
  exit 1
fi

if ! [ -x "$(command -v doxygen)" ]; then
  echo "Can't find doxygen executable. This script requires doxygen to be installed and on your path."
  exit 1
fi

mkdir -p platoengine-doxygen-output

doxygen utilities/doxygen/platoengine/Doxyfile

