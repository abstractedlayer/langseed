#!/bin/sh

if [[ -n "$INCLUDE_NVM" && -n "$NVM_VER" ]]
then
  if [[ -z "$PYENV_VER" || -z "$PYTHON_VER" ]]
  then
    echo "Cannot install NVM without python already installed (PYENV_VER: $PYENV_VER, PYTHON_VER: $PYTHON_VER)"
    exit 1
  fi

  echo "Installing NVM $NVM_VER"
  sh -cl "curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/$NVM_VER/install.sh | bash"

  if [[ -n "$NODE_VER" ]]
  then
    echo "Installing node $NODE_VER"
    sh -cl "nvm install -s $NODE_VER && nvm cache clear"
  else
    echo "Skipping installation of default node version"
  fi

else
  echo "NVM install called but being skipped (INCLUDE_NVM: $INCLUDE_NVM, NVM_VER: $NVM_VER, PYTHON_VER: $PYTHON_VER)"
fi

