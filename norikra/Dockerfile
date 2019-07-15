FROM ragingo/rubies
LABEL maintainer="ragingo"

SHELL ["/bin/bash", "-c"]
ARG DEBIAN_FRONTEND=noninteractive

RUN rbenv install -l
RUN rbenv versions

# jruby
RUN rbenv global jruby-9.1.12.0

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

RUN apt clean
