from alpine:3.15

RUN cd ~ 

# linux build libraries for alpine https://github.com/pyenv/pyenv/wiki#suggested-build-environment
RUN apk add --no-cache git bash build-base libffi-dev openssl-dev bzip2-dev zlib-dev readline-dev sqlite-dev linux-headers

ENV PYENV_VER v2.2.4

RUN git clone https://github.com/pyenv/pyenv.git --branch $PYENV_VER --depth 1 ~/.pyenv 
RUN cd ~/.pyenv && src/configure && make -C src 
RUN echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.profile \
    && echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.profile \
    && echo 'eval "$(pyenv init --path)"' >> ~/.profile \
    && source ~/.profile

ENV PYTHON_VER 3.10.2

RUN source ~/.profile && pyenv install $PYTHON_VER

# linux build libraries for node
RUN apk add -U curl bash ca-certificates openssl ncurses coreutils make gcc g++ libgcc linux-headers grep util-linux binutils findutils

ENV NVM_VER v0.39.1
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/$NVM_VER/install.sh | bash


ENV ENV="/root/.profile"

CMD ["/bin/sh"]

