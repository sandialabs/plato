# Super Plato

This repository is a superproject for organizing Plato's main repositories. 
The goal is to facilitate cloning and managing multiple repositories and several utilities are provided.

## Getting started

Sevearl utilities are provided to set up a spack environment along with specs for platoengine and platoanalyze.
When cloning a new environment, use `utilities/setup-env.sh`, which takes one or two arguments: The configuration, `cpu`, `gpu`, or `gpu-slim`, and for gpu builds, the CUDA architecture version (e.g. 70).

Also, for sourcing an existing environment, use `utilities/build-env.sh` or `utilities/test-env.sh`.
The main difference is that `test-env.sh` will load platoengine and platoanalyze to your path.

