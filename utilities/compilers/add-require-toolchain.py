#!/usr/bin/env python3

import yaml
import sys

yaml_file = 'spack.yaml'
require_value = sys.argv[1]

with open(yaml_file, 'r') as stream:
    spack_yaml = yaml.safe_load(stream)

if 'all' not in spack_yaml['spack']['packages']:
    spack_yaml['spack']['packages']['all'] = {}

spack_yaml['spack']['packages']['all']['require'] = [f"%{require_value}"]

with open(yaml_file, 'w') as stream:
    yaml.dump(spack_yaml, stream)
