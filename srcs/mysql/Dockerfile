FROM alpine:3.12
RUN apk update && apk add openrc mariadb mariadb-common mariadb-client bash
RUN openrc reboot
COPY srcs/start.sh .
COPY srcs/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf
COPY srcs/create_tables.sql .
COPY srcs/wp_db.sql .
COPY srcs/health.sh .
EXPOSE 3306
CMD     bash start.sh
