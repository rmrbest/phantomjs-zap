# Ubuntu 15.10

FROM ubuntu:15.10

MAINTAINER Raul <rmrbest@gmail.com>

# Set ENV
ENV PROXY_PORT 8090
ENV PROXY_HOST 127.0.0.1
ENV PATH_REPORT /tmp/report.xml
ENV PORT_PHANTOM 4444

# Commands

RUN \
    apt-get update && \
    apt-get install openjdk-8-jre supervisor wget && \
    cd /opt && \
    wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2 && \
    tar -xjf phantomjs-2.1.1-linux-x86_64.tar.bz2 && \
    wget https://github.com/zaproxy/zaproxy/releases/download/2.4.3/ZAP_2.4.3_Linux.tar.gz && \
    tar -zxvf ZAP_2.4.3_Linux.tar.gz

ADD ./supervisord.conf /etc/supervisord.conf

VOLUME ["/tmp/reports"]

EXPOSE 4444


