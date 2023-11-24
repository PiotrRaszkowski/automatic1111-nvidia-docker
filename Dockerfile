FROM ubuntu:22.04

SHELL ["/bin/bash", "-c"]

ENV DEBIAN_FRONTEND noninteractive
RUN apt update && apt install -y ubuntu-server

#Install TMalloc
RUN apt install -y libgoogle-perftools-dev

#Install required base packages
RUN apt install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev git

#Create new user
RUN useradd -ms /bin/bash automatic1111

WORKDIR /home/automatic1111
USER automatic1111
ENV HOME /home/automatic1111

#Install pyenv
RUN git clone https://github.com/pyenv/pyenv.git ~/.pyenv

ENV PYENV_ROOT $HOME/.pyenv
RUN echo "$PYENV_ROOT"

ENV PATH $PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH
RUN echo "$PATH"

RUN pyenv --version

#Install Python 3.10
RUN pyenv install 3.10
RUN pyenv global 3.10
RUN pyenv version
RUN python --version

#Install automatic1111
RUN git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui
VOLUME /home/automatic1111/stable-diffusion-webui
WORKDIR /home/automatic1111/stable-diffusion-webui

ADD webui-user.sh .

ENV USE_XFORMERS false
ENV IS_MACOS false
ENV USE_CUDE_118 true

RUN cat webui-user.sh

RUN python -m venv venv
ENV PATH="./venv/bin:$PATH"
RUN echo "$PATH"

RUN pip install --upgrade pip

EXPOSE 7860
ENTRYPOINT [ "./webui.sh" ]