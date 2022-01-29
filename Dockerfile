from alpine:3.15

RUN mkdir -p /var/app/tools

ADD ./scripts /var/app/tools

WORKDIR /var/app/tools/installers
RUN ./builddeps.sh

ARG INCLUDE_PYENV=
ARG PYENV_VER=v2.2.4
ARG PYTHON_VER=3.10.2

WORKDIR /var/app/tools/installers
RUN INCLUDE_PYENV=${INCLUDE_PYENV} PYENV_VER=$PYENV_VER PYTHON_VER=$PYTHON_VER ./pyenv.sh

ARG INCLUDE_NVM=
ARG NVM_VER=v0.39.1
ARG NODE_VER=

WORKDIR /var/app/tools/installers
RUN INCLUDE_NVM=$INCLUDE_NVM PYENV_VER=$PYENV_VER PYTHON_VER=$PYTHON_VER NVM_VER=$NVM_VER NODE_VER=$NODE_VER ./nvm.sh

ENV ENV="/root/.profile"

WORKDIR /var/app
CMD ["/bin/sh"]

