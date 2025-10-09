#!/usr/bin/env python3

import os
import sys
import yaml


llvm_spec_key = "llvm@18.1.8+clang+flang+lld+lldb"
gcc_base_dir = sys.argv[1]
fflags = sys.argv[2]
compilers_only = fflags == "compilers_only"

gfortran_path = os.path.join(gcc_base_dir, 'bin', 'gfortran')
gfortran_lib_path = os.path.join(gcc_base_dir, 'lib64')

gcc_toolchain_flag = "--gcc-toolchain=" + gcc_base_dir

with open('spack.yaml') as stream:
  spack_yaml=yaml.safe_load(stream)
  for package_name, package_info in spack_yaml['spack']['packages'].items():
    if 'externals' in package_info:
      for external in package_info['externals']:
        if llvm_spec_key in external['spec']:
          external['paths'] = external.get('paths',{})
          external['paths']['f77'] = gfortran_path
          external['paths']['fc'] = gfortran_path
          external['extra_attributes'] = external.get('extra_attributes', {})
          external['extra_attributes']['compilers']['fortran']=gfortran_path
          if not compilers_only:
            external['extra_attributes']['extra_rpaths'] = [gfortran_lib_path]
            external['extra_attributes']['flags'] = external.get('flags', {})
            external['extra_attributes']['flags'] = {'fflags': fflags, 'cflags': gcc_toolchain_flag, 'cxxflags': gcc_toolchain_flag}

with open('spack.yaml', 'w') as stream:
  yaml.dump(spack_yaml, stream)
