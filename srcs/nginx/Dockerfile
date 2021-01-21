FROM alpine

RUN		apk update
RUN		apk add nginx openssl bash openssh
COPY    srcs/default.conf /etc/nginx/conf.d
COPY    srcs/init.sh /
COPY    srcs/index.html /www/index.html
RUN     adduser -D -g 'www' www
RUN     chown -R www:www /www
RUN     mkdir /etc/nginx/ssl
RUN     openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj '/C=MA/ST=rhamna/L=Bengruir/O=1337/CN=localhost' -keyout /etc/nginx/ssl/localhost.key -out /etc/nginx/ssl/localhost.crt

RUN     adduser -D user
RUN     echo "user:password"|chpasswd
RUN     ssh-keygen -A

RUN     chmod +x /init.sh
RUN     mkdir /run/nginx/
CMD     /init.sh
EXPOSE 22 80 443