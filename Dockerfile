FROM python:3.10-bullseye
WORKDIR /usr/html

RUN apt update \
  && apt install -y git vim locales \
  && localedef -f UTF-8 -i ja_JP ja_JP.UTF-8

ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8
ENV TZ JST-9
ENV TERM xterm

RUN pip install --upgrade pip setuptools \
  # PEP8 formater & linter
  && pip install autopep8 flake8

# venvに入るためのエイリアス
RUN echo 'alias va="source .venv/bin/activate"' >> /root/.bashrc
