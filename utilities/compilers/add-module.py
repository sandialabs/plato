#!/usr/bin/env python3

import sys
import yaml

compiler_spec = sys.argv[1]
modules = [module for module in sys.argv[2:]]

with open('spack.yaml') as stream:
  spack_yaml=yaml.safe_load(stream)
  for package_name,package_info in spack_yaml['spack']['packages'].items():
    if 'externals' in package_info:
      for external in package_info['externals']:
        if compiler_spec in external['spec']:
          if 'modules' not in external:
            external['modules'] = []
          external['modules'].extend(modules)     
    
with open('spack.yaml', 'w') as stream:
  yaml.dump(spack_yaml, stream)
