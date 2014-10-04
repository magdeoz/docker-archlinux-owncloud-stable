FROM base/archlinux:latest
MAINTAINER UserTaken <elysian@live.com>
RUN pacman -Syu php-apache php-pear php-gd php-intl php-sqlite exiv2 --noconfirm --ignore filesystem && \
	rm /var/cache/pacman/pkg/*
RUN curl https://download.owncloud.org/community/owncloud-7.0.2.tar.bz2 | tar xj && \
	mkdir -p owncloud/data/tmp && \
	chmod 770 owncloud/data && \
	mv owncloud/* /srv/http/ && \
	rm -rf owncloud && \
	chown -R http:http /srv/http
	
ADD php.ini /etc/php/
ADD httpd.conf /etc/httpd/conf/
EXPOSE 80
CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]
