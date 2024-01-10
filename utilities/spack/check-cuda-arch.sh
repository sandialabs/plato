#!/bin/bash

if [[ -z "$CUDA_ARCH" ]]; then
  source utilities/detail/colors.sh
  echo -e "${RED}Warning: Missing cuda arch parameter, please edit your spack.yaml to set the cuda_arch${NC}"
  CUDA_ARCH="cuda_arch"
fi

