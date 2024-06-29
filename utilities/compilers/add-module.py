#!/usr/bin/env python3

import sys
import yaml

compiler_spec = sys.argv[1]
modules = [module for module in sys.argv[2:]]

with open('spack.yaml') as stream:
  spack_yaml=yaml.safe_load(stream)
  for compiler in spack_yaml['spack']['compilers']:
    if compiler_spec in compiler['compiler']['spec']:
      compiler_obj = compiler['compiler']
      compiler_obj['modules'] = modules

with open('spack.yaml', 'w') as stream:
  yaml.dump(spack_yaml, stream)

