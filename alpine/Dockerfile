from alpine:3.15

RUN mkdir -p /var/app/tools/installers

# Adding each file individually to attempt to help with the cacheing
ADD ./scripts/installers/builddeps.sh /var/app/tools/installers/builddeps.sh
WORKDIR /var/app/tools/installers
RUN ./builddeps.sh

# Install pyenv
ARG INCLUDE_PYENV=
ARG PYENV_VER=v2.2.4
ARG PYTHON_VER=3.10.2

ADD ./scripts/installers/pyenv.sh /var/app/tools/installers/pyenv.sh
WORKDIR /var/app/tools/installers
RUN INCLUDE_PYENV=${INCLUDE_PYENV} PYENV_VER=$PYENV_VER PYTHON_VER=$PYTHON_VER ./pyenv.sh

# Install nvm
ARG INCLUDE_NVM=
ARG NVM_VER=v0.39.1
ARG NODE_VER=

ADD ./scripts/installers/nvm.sh /var/app/tools/installers/nvm.sh
WORKDIR /var/app/tools/installers
RUN INCLUDE_NVM=$INCLUDE_NVM PYENV_VER=$PYENV_VER PYTHON_VER=$PYTHON_VER NVM_VER=$NVM_VER NODE_VER=$NODE_VER ./nvm.sh

# Install rbenv
ARG INCLUDE_RBENV=
ARG RBENV_VER=v1.2.0
ARG RB_BUILD_VER=v20220125

ADD ./scripts/installers/rbenv.sh /var/app/tools/installers/rbenv.sh
WORKDIR /var/app/tools/installers
RUN INCLUDE_RBENV=$INCLUDE_RBENV RBENV_VER=$RBENV_VER RB_BUILD_VER=$RB_BUILD_VER ./rbenv.sh

# Setup profile
ENV ENV="/root/.profile"

WORKDIR /var/app
CMD ["/bin/sh"]

