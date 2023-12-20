# Super Plato

This repository is a superproject for organizing Plato's main repositories. 
The goal is to facilitate cloning and managing multiple repositories and several utilities are provided.

## Getting started

If it isn't already in your rc script, ensure you have "git" and "git-lfs" loaded, e.g.,
```
module load cde/v3/git/2.35.2
module load cde/v3/git-lfs/2.11.0
```

Also, if you are running `git lfs` for the first time on a system, `git lfs install` must be run before cloning this repo.
If it is not run, files managed by LFS will be downloaded as text-based pointer files.
This only has to be done once per system as it modifies your git configuration.

### General

Then, clone this repository using the `--recursive` option and set up a spack environment as:
```
git clone git@cee-gitlab.sandia.gov:1540-compsim/plato/plato.git --recursive
cd plato
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

### CEE-LAN

An automated build of Plato is available at `/projects/plato/automated-builds`. 
Different configurations are contained in separate directories, such as `cpu` and `gpu`.
A script is available to set up a build area using the pre-built dependencies.
```
git clone git@cee-gitlab.sandia.gov:1540-compsim/plato/plato.git --recursive
cd plato
source utilities/checkout-develop.sh
source utilities/setup-for-cee-lan.sh <build configuration> [CUDA architecture]
```
The option `<build configuration>` must match one of the automated build configurations in `/projects/plato/automated-builds`.
This will setup a `spack.yaml` using the same spec and compiler and also chain your new installation to the installation in the `projects` directory.
Note that you are still free to edit your `spack.yaml` file, but doing so may result in new dependencies being built.

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

Note that for open merge requests, any push to the Gitlab server will launch a new pipeline.
If you don't need a pipeline to run, `[ci skip]` can be appended to commit messages and no new pipelines will be launched.
These pipelines are considered failing, and so merge requests will still require a subsequent passing pipeline.
