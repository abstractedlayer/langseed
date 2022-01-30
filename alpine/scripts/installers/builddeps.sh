#!/bin/sh
# python build libraries for alpine https://github.com/pyenv/pyenv/wiki#suggested-build-environment
apk add --no-cache \
  git \
  bash \
  build-base \
  libffi-dev \
  openssl-dev \
  bzip2-dev \
  zlib-dev \
  readline-dev \
  sqlite-dev \
  linux-headers

# node build libraries for alpine - may be some overlap with python
apk add --no-cache \
  curl \
  bash \
  ca-certificates \
  openssl \
  ncurses \
  coreutils \
  make \
  gcc \
  g++ \
  libgcc \
  linux-headers \
  grep \
  util-linux \
  binutils \
  findutils

# ruby build libraries for alpine
apk add --no-cache \
    bash \
    git \
    wget \
    curl \
    vim \
    build-base \
    readline-dev \
    openssl-dev \
    zlib-dev \
    linux-headers \
    imagemagick-dev 
#    libffi-dev 


