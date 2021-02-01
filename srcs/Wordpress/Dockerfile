FROM alpine

RUN		apk update
RUN		apk add nginx wget bash
RUN     apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session
COPY    srcs/default.conf /etc/nginx/conf.d
COPY    srcs/init.sh /
RUN     mkdir /www
RUN     adduser -D -g 'www' www
RUN     chown -R www:www /www
RUN     wget https://wordpress.org/latest.tar.gz 
RUN     tar -xzvf latest.tar.gz -C /www

RUN     chmod +x /init.sh
RUN     mkdir /run/nginx/
CMD     /init.sh