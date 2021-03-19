FROM alpine:3.12

RUN apk add vsftpd openssl bash openrc
RUN openrc reboot
COPY srcs/vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY srcs/start.sh .
RUN adduser admin -D && echo "admin:123" |chpasswd
RUN mkdir -p /home/admin
RUN mkdir -p /etc/ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj '/C=MA/ST=rhamna/L=Bengruir/O=1337/CN=localhost' -keyout /etc/ssl/vsftpd.key -out /etc/ssl/vsftpd.crt
RUN chmod 750 /home/admin && chown -R admin: /home/admin
CMD bash start.sh