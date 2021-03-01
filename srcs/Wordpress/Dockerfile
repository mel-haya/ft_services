FROM alpine:3.12

RUN		apk update
RUN		apk add nginx wget bash supervisor openrc
RUN     apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session
COPY    srcs/default.conf /etc/nginx/conf.d
COPY    srcs/init.sh /
COPY    srcs/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
RUN     mkdir /www
RUN     wget https://wordpress.org/latest.tar.gz 
RUN     tar -xzvf latest.tar.gz -C /www
RUN     adduser -D -g 'www' www
RUN     chown -R www:www /www/wordpress
COPY    srcs/wp-config.php /www/wordpress
RUN     mkdir /run/nginx/
RUN     mkdir -p /var/run/php 
RUN     openrc reboot
EXPOSE  5050
CMD     ["/usr/bin/supervisord" , "-c", "/etc/supervisor/conf.d/supervisord.conf"]