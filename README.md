# Super Plato

This repository is a superproject for organizing Plato's main repositories. 
The goal is to facilitate cloning and managing multiple repositories and several utilities are provided.

## Getting started

If it isn't already in your rc script, ensure you have "git" and "git-lfs" loaded, e.g.,
```
module load cde/v3/git/2.35.2
module load cde/v3/git-lfs/2.11.0
```

Then, clone this repository using the `--recursive` option and set up a spack environment as:
```
git clone git@cee-gitlab.sandia.gov:plato/super-plato.git --recursive
cd super-plato
source utilities/setup-env.sh <build configuration> [CUDA architecture]
```
This will clone and checkout all submodules, as well as set up a spack environment for a cpu build.
The `setup-env.sh` script accepts `cpu`, `gpu`, and `gpu-slim` build configurations, and the `gpu` options require a CUDA architecture argument.
The `gpu-slim` spec builds platoanalyze without hex elements and all penalization methods for a faster build.

After the initial clone, each submodule may be in a detached head state.
While not necessary to build, the main development branches of each repository may be checked out as:
```
source utilities/checkout-develop.sh
```

To chain the new installation to an existing installation, use the `utilities/chain-installation.sh` script:
```
source utilities/chain-installation.sh /path/to/existing/installation
```
The path should be to the parent of the spack directory containing the installation.

After the intial setup, an existing environment can be initialized using `utilities/build-env.sh` or `utilities/test-env.sh`.
The main difference is that `test-env.sh` will load platoengine and platoanalyze to your path.

