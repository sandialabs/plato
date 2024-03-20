#!/bin/bash

# Replace clang f77 and fc with gnu's
GFORTRAN_F77=$(grep "f77:.*gfortran" spack.yaml)
GFORTRAN_FC=$(grep "fc:.*gfortran" spack.yaml)
sed -i "s|[ \t]*f77: null|$GFORTRAN_F77|" spack.yaml
sed -i "s|[ \t]*fc: null|$GFORTRAN_FC|" spack.yaml
