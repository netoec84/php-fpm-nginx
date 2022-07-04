FROM debian:jessie-slim

LABEL maintainer="Jose GUEVARA <jose@jewif.com>"

COPY ./scripts /tmp/

RUN chmod +x /tmp/*.sh
RUN sh /tmp/env.sh
RUN sh /tmp/common-tools.sh
RUN sh /tmp/apt.sh
RUN sh /tmp/js-tools.sh
RUN sh /tmp/composer.sh
RUN sh /tmp/clean.sh

COPY ./config/ /
COPY ./5.6/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN rm -f /etc/motd && chmod +x /etc/update-motd.d/* && ln -s /etc/update-motd.d/50-phpdocker /etc/motd

EXPOSE 80 443 9000

WORKDIR /app

USER php

CMD ["sudo", "supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
