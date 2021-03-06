FROM base/archlinux:latest
MAINTAINER UserTaken <elysian@live.com>
MAINTAINER Magdeoz <hackmagodeoz@gmail.com>
RUN pacman -Sy php-apache php-gd php-intl php-sqlite php-mcrypt exiv2 openssl \
	--noconfirm && rm /var/cache/pacman/pkg/*

RUN curl http://download.owncloud.org/community/owncloud-latest.tar.bz2 | tar xj && \
	mkdir -p owncloud/data/tmp && \
	chmod 770 owncloud/data && \
	mv owncloud/* owncloud/.htaccess /srv/http/ && \
	rm -rf owncloud && \
	chown -R http:http /srv/http

RUN cd /etc/httpd/conf && \
	openssl genpkey -algorithm RSA -pkeyopt rsa_keygen_bits:2048 -out server.key && \
	chmod 600 server.key && \
	openssl req -new -batch -subj '/CN=ownCloud' -key server.key -out server.csr  && \
	openssl x509 -req -days 365 -in server.csr -signkey server.key -out server.crt

RUN sed -i -e 's/ErrorLog/#ErrorLog/' -e 's/TransferLog/#TransferLog/' -e '86iErrorLog /dev/fd/1' \
	-e '86iCustomLog /dev/fd/1 custom' /etc/httpd/conf/extra/httpd-ssl.conf
	
ADD php.ini /etc/php/
ADD httpd.conf /etc/httpd/conf/
VOLUME /srv/http/data
EXPOSE 80 443
CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]
