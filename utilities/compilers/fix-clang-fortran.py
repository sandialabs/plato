#!/usr/bin/env python3

import os
import sys
import yaml

gcc_base_dir = sys.argv[1]
fflags = sys.argv[2]

gfortran_path = os.path.join(gcc_base_dir, 'bin', 'gfortran')
gfortran_lib_path = os.path.join(gcc_base_dir, 'lib64')

gcc_toolchain_flag = "--gcc-toolchain=" + gcc_base_dir

with open('spack.yaml') as stream:
  spack_yaml=yaml.safe_load(stream)
  for compiler in spack_yaml['spack']['compilers']:
    if 'clang' in compiler['compiler']['spec']:
      compiler_obj = compiler['compiler']
      compiler_obj['paths']['f77'] = gfortran_path
      compiler_obj['paths']['fc'] = gfortran_path
      compiler_obj['extra_rpaths'] = [gfortran_lib_path]
      compiler_obj['flags'] = {'fflags': fflags, 'cflags': gcc_toolchain_flag, 'cppflags': gcc_toolchain_flag}

with open('spack.yaml', 'w') as stream:
  yaml.dump(spack_yaml, stream)

