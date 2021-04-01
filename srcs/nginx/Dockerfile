FROM alpine:3.12

RUN		apk update
RUN		apk add nginx openssl bash openssh openrc
COPY    srcs/default.conf /etc/nginx/conf.d
COPY    srcs/init.sh .
COPY    srcs/health.sh .
COPY    srcs/index.html /www/index.html
RUN     mkdir /etc/nginx/ssl

RUN     adduser -D -g 'www' www
RUN     chown -R www:www /www
RUN     openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj '/C=MA/ST=rhamna/L=Bengruir/O=1337/CN=localhost' -keyout /etc/nginx/ssl/localhost.key -out /etc/nginx/ssl/localhost.crt

RUN     adduser -D user
RUN     echo "user:password"|chpasswd
RUN     openrc reboot
RUN     ssh-keygen -A

RUN     mkdir /run/nginx/
EXPOSE 80 443 22
CMD     bash init.sh
