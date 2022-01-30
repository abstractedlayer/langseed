FROM ubuntu:latest

RUN apt-get update
RUN apt-get upgrade -y

# install pyenv
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y make build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

RUN apt-get install -y git

RUN git clone https://github.com/pyenv/pyenv.git ~/.pyenv

RUN cd ~/.pyenv && src/configure && make -C src

RUN echo 'export PYENV_ROOT="$HOME/.pyenv"' >> $HOME/.profile
RUN echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> $HOME/.profile
RUN echo 'eval "$(pyenv init --path)"' >> $HOME/.profile
RUN echo 'eval "$(pyenv init -)"' >> $HOME/.profile


# install nvm
RUN apt-get install -y wget
RUN sh -cl "wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash"

# setup shell env
ENV ENV=$HOME/.profile
WORKDIR $HOME
SHELL ["/usr/bin/bash", "-c"]
CMD ["/usr/bin/bash", "-l"]

