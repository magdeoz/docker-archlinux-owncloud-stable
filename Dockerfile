FROM base/archlinux:latest
MAINTAINER UserTaken <elysian@live.com>
RUN pacman -Syu php-apache php-gd php-intl php-sqlite php-mcrypt exiv2 \
	--noconfirm --ignore filesystem && \
	rm /var/cache/pacman/pkg/*
RUN curl https://download.owncloud.org/community/owncloud-7.0.2.tar.bz2 | tar xj && \
	mkdir -p owncloud/data/tmp && \
	chmod 770 owncloud/data && \
	mv owncloud/* /srv/http/ && \
	rm -rf owncloud && \
	chown -R http:http /srv/http

RUN cd /etc/httpd/conf && \
	openssl genpkey -algorithm RSA -pkeyopt rsa_keygen_bits:2048 -out server.key && \
	chmod 600 server.key && \
	openssl req -new -batch -subj '/CN=ownCloud' -key server.key -out server.csr  && \
	openssl x509 -req -days 3650 -in server.csr -signkey server.key -out server.crt
	
ADD php.ini /etc/php/
ADD httpd.conf /etc/httpd/conf/
EXPOSE 80 443
CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]
