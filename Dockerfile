FROM alpine:3.8
LABEL author="Serge NOEL <serge.noel@easylinux.fr>"


RUN apk add --update bash \
    && cp /etc/squid/squid.conf /etc/squid/squid.conf.dist

COPY squid.conf /etc/squid/squid.conf
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod 755 /usr/local/bin/entrypoint.sh

EXPOSE 3128/tcp
VOLUME /var/cache/squid
ENTRYPOINT ["/sbin/entrypoint.sh"]
