#!/bin/bash

# Parses common setup script options
parse_setup_options() {
  while getopts "hc:g:a:" arg; do
    case $arg in
      c) # Configuration
        CONFIGURATION=${OPTARG}
        echo "Config: $CONFIGURATION"
        ;;
      g) # GPU arch
        CUDA_ARCH=${OPTARG}
        echo "GPU CUDA arch: $CUDA_ARCH"
        ;;
      a) # System arch
        SYSTEM_ARCH="arch=${OPTARG}"
        echo "System: $SYSTEM_ARCH"
        ;;
      h)
        echo "Spack environment setup"
        echo "Options: -c configuration [-g cuda-architecture] [-a system-architecture]"
        echo " c  Configuration (required, e.g. cpu, gpu, cpu-clang-dev)"
        echo " g  CUDA architecture (required for gpu builds, spack cuda_arch argument)"
        echo " a  System architecture (spack arch argument)"
        exit 0
        ;;
    esac
  done

  if [[ -z $CONFIGURATION ]]; then
    echo "Error: Missing required configuration parameter"
    exit 1
  fi
}
