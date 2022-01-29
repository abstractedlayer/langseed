#!/bin/sh

if [[ -n "$INCLUDE_NVM" && -n "$NVM_VER" ]]
then
  source $HOME/.profile

  if [[ -z "$PYENV_VER" ]]
  then
    PYENV_VER=v2.2.4
    echo "Defaulting PYENV_VER to $PYENV_VER for node install"
  fi

  if [[ -z "$PYTHON_VER" ]]
  then
    PYTHON_VER=3.10.2
    echo "Defaulting PYTHON_VER to $PYENV_VER for node install"
  fi

  if ! command -v python &> /dev/null
  then
    echo "Installing python for Node"
    INCLUDE_PYENV=1 PYENV_VER=$PYENV_VER PYTHON_VER=$PYTHON_VER sh -c ./pyenv.sh
  fi



  echo "Installing NVM $NVM_VER"
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/$NVM_VER/install.sh | bash

  if [[ -n "$NODE_VER" ]]
  then
    echo "Installing node $NODE_VER"
    source $HOME/.profile
    nvm install -s $NODE_VER
  else
    echo "Skipping installation of default node version"
  fi

else
  echo "NVM install called but being skipped (INCLUDE_NVM: $INCLUDE_NVM, NVM_VER: $NVM_VER, PYTHON_VER: $PYTHON_VER)"
fi

