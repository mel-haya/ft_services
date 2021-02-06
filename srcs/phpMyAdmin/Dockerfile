FROM alpine

RUN		apk update
RUN		apk add nginx wget bash supervisor openrc
RUN     apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session
COPY    srcs/default.conf /etc/nginx/conf.d
COPY    srcs/init.sh /
COPY    srcs/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
RUN     mkdir /www
RUN     wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-english.tar.gz
RUN     tar -xzvf phpMyAdmin-5.0.4-english.tar.gz -C /www
RUN     mv /www/phpMyAdmin-5.0.4-english /www/phpMyAdmin
RUN     adduser -D -g 'www' www
RUN     chown -R www:www /www/phpMyAdmin
RUN     mkdir /run/nginx/
RUN     openrc reboot
CMD     ["/usr/bin/supervisord" , "-c", "/etc/supervisor/conf.d/supervisord.conf"]