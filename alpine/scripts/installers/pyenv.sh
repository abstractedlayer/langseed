
if [[ -n "$INCLUDE_PYENV" && -n "$PYENV_VER" ]]
then
  echo "Python requested - pyenv ver: $PYENV_VER"
  echo ""
  echo "Cloning pyenv"
  git clone https://github.com/pyenv/pyenv.git --branch $PYENV_VER --depth 1 ~/.pyenv

  echo "Making pyenv"
  cd $HOME/.pyenv && src/configure && make -C src

  echo "Updating profile with pyenv values"
  echo 'export PYENV_ROOT="$HOME/.pyenv"' >> $HOME/.profile
  echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> $HOME/.profile
  echo 'eval "$(pyenv init --path)"' >> $HOME/.profile
  source ~/.profile

  if [[ -n "$PYTHON_VER" ]]
  then
    echo "Installing default python version $PYTHON_VER"
    source $HOME/.profile && pyenv install $PYTHON_VER && pyenv global $PYTHON_VER
  else
    echo "No Python version specified - skipping default installation"
  fi
else
  echo "Python script called but not configured - skipping (for now)"
fi


