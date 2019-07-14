FROM ubuntu:18.04
LABEL maintainer="ragingo"

SHELL ["/bin/bash", "-c"]
ARG DEBIAN_FRONTEND=noninteractive

# general
RUN apt update
RUN apt -y upgrade
RUN apt -y install --no-install-recommends openjdk-8-jre
RUN apt -y install --no-install-recommends wget curl vim iputils-ping

# ruby
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

# system -> jruby
RUN rbenv global jruby-9.1.12.0
RUN rbenv versions
RUN ruby -v

# norikra
RUN gem install norikra --no-ri --no-rdoc -V
RUN rbenv rehash
RUN mkdir -p /var/log/norikra

# jruby -> cruby 2.4.1
RUN rbenv global 2.4.1

# fluentd
RUN gem install fluentd --no-ri --no-rdoc -V
RUN rbenv rehash
RUN fluentd --setup /etc/fluent
ADD ./fluent.conf /etc/fluent/fluent.conf

# fluent-plugin-norikra
RUN apt -y install --no-install-recommends ruby-dev
RUN gem install fluent-plugin-norikra --no-ri --no-rdoc -V
RUN rbenv rehash

# cruby 2.4.1 -> jruby
RUN rbenv global jruby-9.1.12.0

# open ports
EXPOSE 26578
EXPOSE 26571
EXPOSE 24224

# norikra start
CMD norikra start -Xmx2g --pidfile /var/run/norikra.pid --logdir=/var/log/norikra

# RUN echo '{"col2":"bbb","col3":"ccc","col1":"aaa"}' | norikra-client event send test

RUN apt clean

# RUN gem environment
