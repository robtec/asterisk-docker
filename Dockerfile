
FROM debian:bullseye-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y && \
    apt-get install --no-install-recommends -y \
    build-essential wget libncurses5-dev libssl-dev \
    libxml2-dev libsqlite3-dev uuid-dev libjansson-dev \
    libsrtp2-dev libedit-dev libreadline-dev \
    libopus-dev libvorbis-dev && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN wget http://downloads.asterisk.org/pub/telephony/asterisk/releases/asterisk-1.8.32.3.tar.gz && \
  tar xvzf asterisk-1.8.32.3.tar.gz

RUN cd asterisk-1.8.32.3 && \
  ./configure && \
  make && \
  make install
