FROM ragingo/ubuntu-18.04-full-update
LABEL maintainer="ragingo"

SHELL ["/bin/bash", "-c"]
ARG DEBIAN_FRONTEND=noninteractive

RUN apt -y install --no-install-recommends openjdk-8-jre

RUN apt -y install rbenv
RUN rbenv install 2.4.1
RUN rbenv install jruby-9.1.12.0
RUN rbenv global jruby-9.1.12.0
RUN ls -al /root/.rbenv
RUN ls -al /root/.rbenv/shims
RUN echo 'export PATH="/root/.rbenv/shims:$PATH"' > ~/.bash_profile
RUN echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
RUN source ~/.bash_profile
ENV PATH /root/.rbenv/shims:$PATH
RUN echo $PATH

RUN rbenv versions
RUN ruby -v

RUN apt clean
