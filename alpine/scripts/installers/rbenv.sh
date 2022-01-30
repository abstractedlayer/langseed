
if [[ -n "$INCLUDE_RBENV" && -n "$RBENV_VER" ]]
then
  echo "Cloning rbenv $RBENV_VER"
  git clone https://github.com/rbenv/rbenv.git --branch $RBENV_VER --depth 1 ~/.rbenv

  echo "Building rbenv"
  cd ~/.rbenv && src/configure && make -C src

  echo "Installing rbenv plugin: ruby-build $RB_BUILD_VER"
  mkdir plugins
  git clone https://github.com/rbenv/ruby-build.git --branch $RB_BUILD_VER --depth 1 plugins/ruby-build

  echo "Configuring profile"
  echo 'export PATH=$HOME/.rbenv/bin:$PATH' >> ~/.profile
  echo 'eval "$(rbenv init - ash)"' >> ~/.profile
else
  echo "Not installing RBENV (INCLUDE_RBENV: $INCLUDE_RBENV, RBENV_VER: $RBENV_VER)"
fi

