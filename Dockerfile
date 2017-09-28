FROM resin/armv7hf-debian
MAINTAINER Eloco <elogicocal@gmail.com>

RUN apt-get update


RUN apt-get install  nano
RUN apt-get install -y supervisor
RUN mkdir -p /var/log/supervisor


COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

CMD ["/usr/bin/supervisord"]
