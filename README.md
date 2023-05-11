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
source utilities/checkout-develop.sh
source utilities/setup-env.sh <build configuration> [CUDA architecture]
```
This will clone and checkout all submodules, as well as set up a spack environment for a cpu build.
The `setup-env.sh` script accepts `cpu`, `cpu-python-app`, `cpu-debug`, `dakota`, `gpu`, and `gpu-slim` build configurations, and the `gpu` options require a CUDA architecture argument.
The `gpu-slim` spec builds platoanalyze without hex elements and all penalization methods for a faster build.

After the initial clone, each submodule may be in a detached head state, and so the `checkout-develop.sh` script may be used to checkout the main development branches of each repo. 
Note that `checkout-develop.sh` will perform a hard reset, and so if it is used on an already checked-out repository with changes, those changes may be lost.

To chain the new installation to an existing installation, use the `utilities/chain-installation.sh` script:
```
source utilities/chain-installation.sh /path/to/existing/installation
```
The path should be to the parent of the spack directory containing the installation.

After the initial setup, an existing environment can be initialized using `utilities/build-env.sh` or `utilities/test-env.sh`.
The main difference is that `test-env.sh` will load platoengine and platoanalyze to your path.

## Managing branches

Since each repository is a submodule, `git submodule foreach` can be used to manage branches and common git operations.
However, a few scripts are also provided to simplify common operations.
For example, checking out a new branch in each repository can be accomplished with
```
source utilities/create-branch.sh <branch-name>
```
This creates a branch with the same name in each repository and checks it out.
Existing branches can be checked out using
```
source utilities/checkout-branch.sh <branch-name>
```
which will checkout the branch if it exists, and checkout and pull the default branch if it does not exist.

## CI and merge requests

CI for Plato is run out of this repository and only runs for merge requests and manual triggers from the web interface.
For multi-repo merges, each branch must have the same name, which can be done using the `create-branch.sh` script.
For a merge request, the pipeline will attempt to checkout a branch with the name of the source branch in each repo, falling back on the default branch if it doesn't exist.
