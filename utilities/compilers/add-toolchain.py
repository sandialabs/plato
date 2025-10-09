#!/usr/bin/env python3

import yaml
import sys

yaml_file = 'spack.yaml'
toolchain_name = sys.argv[1]
c_cxx_spec = sys.argv[2]
fortran_spec = sys.argv[3]

with open(yaml_file, 'r') as stream:
    spack_yaml = yaml.safe_load(stream)

if 'toolchains' not in spack_yaml['spack']:
    spack_yaml['spack']['toolchains'] = {}
spack_yaml['spack']['toolchains'][toolchain_name] = [
    {'spec': f'%c={c_cxx_spec}', 'when': '%c'},
    {'spec': f'%cxx={c_cxx_spec}', 'when': '%cxx'},
    {'spec': f'%fortran={fortran_spec}', 'when': '%fortran'}
]
with open(yaml_file, 'w') as stream:
    yaml.dump(spack_yaml, stream)
