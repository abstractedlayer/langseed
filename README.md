# LangSeed
## Overview
A set of Dockerfiles for your operating system of choice to help create a flexible development environment

The goal is to allow you to easily install any version of any language that you want to work with

The first layer of options is to allow you to install language version managers (e.g. pyenv, nvm,  rbenv, etc)

The second layer of options allows you to pre-install a selected language version (e.g. 3.10.2 of python, lts/gallium of node, etc)

After that, code crazy, code nuts

## Managers
[pyenv](https://github.com/pyenv/pyenv)

[nvm](https://github.com/nvm-sh/nvm)

[rbenv](https://github.com/rbenv/rbenv)

## Docker Args
| Build Arg      | Description                                                       |
|----------------|-------------------------------------------------------------------|
| INCLUDE_PYENV= | If non-zero in length, will install pyenv                         |
| PYENV_VER=     | Version of pyenv to install - Dockerfile specifies a default      |
| PYTHON_VER=    | If set, will install a default version of python                  |
|----------------|-------------------------------------------------------------------|
| INCLUDE_NVM=   | If non-zero in length, will install nvm                           |
| NVM_VER=       | Version of nvm to install - Dockerfile specifies a default        |
| NODE_VER=      | If set, will install a default version of node                    |
|----------------|-------------------------------------------------------------------|
| INCLUDE_RBENV= | If non-zero in length, will install rbenv                         |
| RBENV_VER=     | Version of rbenv to install - Dockerfile specifies a default      |
| RB_BUILD_VER=  | Version of ruby-build to install - Dockerfile specifies a default |
|----------------|-------------------------------------------------------------------|

