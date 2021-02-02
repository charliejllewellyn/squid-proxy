FROM ubuntu:focal
LABEL maintainer="sameer@damagehead.com"

ENV SQUID_VERSION=4.10-1ubuntu1.2 \
    SQUID_CACHE_DIR=/var/spool/squid \
    SQUID_LOG_DIR=/var/log/squid \
    SQUID_USER=proxy

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y squid=${SQUID_VERSION}* \
 && rm -rf /var/lib/apt/lists/* 

COPY squid.conf /etc/squid/squid.conf

COPY entrypoint.sh /sbin/entrypoint.sh
RUN chmod 755 /sbin/entrypoint.sh
COPY  domain_allow_list.txt /etc/squid/domain_allow_list.txt
RUN chmod 755 /etc/squid/domain_allow_list.txt
COPY commands.sh /sbin/commands.sh
RUN chmod 755 /sbin/commands.sh

EXPOSE 3128/tcp
ENTRYPOINT ["/sbin/entrypoint.sh"]
