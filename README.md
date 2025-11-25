# Super Plato

This repository is a superproject for organizing Plato's main repositories. 
The goal is to facilitate cloning and managing multiple repositories and several utilities are provided.

## Getting started

If it isn't already in your rc script, ensure you have "git" and "git-lfs" loaded.

Also, if you are running `git lfs` for the first time on a system, `git lfs install` must be run before cloning this repo.
If it is not run, files managed by LFS will be downloaded as text-based pointer files.
This only has to be done once per system as it modifies your git configuration.

### General

Then, clone this repository using the `--recursive` option and set up a spack environment as:
```
git clone https://github.com/sandialabs/plato.git --recursive
cd plato
./utilities/setup-env.sh -c <build configuration> [-g CUDA architecture] [-a system architecture]
```
This will clone and checkout all submodules, as well as set up a spack environment for a cpu build.
The `setup-env.sh` script accepts `cpu`, `cpu-clang-dev`, `cpu-python-app`, `cpu-debug`, `dakota`, `gpu`, and `gpu-slim` build configurations, and the `gpu` options require a CUDA architecture argument.
The `gpu-slim` spec builds platoanalyze without hex elements and all penalization methods for a faster build.
The `-a` system architecture option sets the spack `arch` parameter, which is mainly useful for building for generic `x86_64`.

To chain the new installation to an existing installation, use the `utilities/chain-installation.sh` script:
```
./utilities/chain-installation.sh /path/to/existing/installation
```
The path should be to the parent of the spack directory containing the installation.

After the initial setup, an environment can be activated using `utilities/build-env.sh` or `utilities/test-env.sh`.
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
