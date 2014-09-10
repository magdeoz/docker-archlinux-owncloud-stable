FROM base/archlinux:latest
RUN pacman-key --init
RUN pacman-key --populate archlinux
RUN pacman -Sy sed php php-apache apache php-pear php-gd php-intl php-sqlite sqlite exiv2 wget --noconfirm --ignore filesystem
RUN cd /tmp ; wget https://download.owncloud.org/community/owncloud-7.0.2.tar.bz2
RUN tar xf owncloud-7.0.2.tar.bz2
RUN mkdir owncloud/data
RUN chmod 770 owncloud/data
RUN mv owncloud/* /srv/http/
RUN chown -R http:http /srv/http/
ADD php.ini /etc/php/
ADD httpd.conf /etc/httpd/conf/
EXPOSE 80
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
