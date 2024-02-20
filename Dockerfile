FROM ubuntu:latest
MAINTAINER Oytun <info@oytun.org>
ENV TZ=Europe/Istanbul
ENV DEBIAN_FRONTEND=noninteractive
ENV TERM=/bin/bash
ENV PATH=$PATH:/bin:/sbin
COPY virtualmin-install.sh /root
COPY entrypoint.sh /
USER root
RUN set -x \
&& sed -i s/true/false/ /etc/apt/apt.conf.d/docker-gzip-indexes \
&& apt-get update \
&& apt-get upgrade -y \
&& apt-get -y install apt-utils bash fish curl dialog gnupg gnupg2 gnupg1 nano perl postgresql postgresql-client procps screen sudo ssh wget network-manager \
&& apt-get -y autoremove \
&& mkdir -p /etc/network \
&& touch /etc/network/interfaces
RUN chmod +x /root/virtualmin-install.sh \
&& ./root/virtualmin-install.sh -v -f -n ${HOSTNAME}.${DOMAIN}
RUN apt-get install -y ffmpeg libapache2-mod-php libdbd-pg-perl php-geoip php-imagick php-dev php-memcached php-cgi php-cli php-common php-curl php-gd php-gmp php-imap php-ldap php-mcrypt php-mysql subversion \
&& apt-get -y autoremove
RUN echo "virtual_alias_maps = hash:/etc/postfix/virtual" >> /etc/postfix/main.cf \
&& echo "mailbox_command = /usr/bin/procmail" >> /etc/postfix/main.cf \
&& chgrp -v root /usr/bin/procmail \
&& chmod 4755 /usr/bin/procmail \
&& chmod +x /entrypoint.sh
EXPOSE 20 21 22 25 53 53/udp 80 110 111 143 443 587 993 995 3306 10000 20000 38532 40259
ENTRYPOINT ["/bin/bash", "-c", "/entrypoint.sh"]
# CMD ["service", "webmin", "start"]
