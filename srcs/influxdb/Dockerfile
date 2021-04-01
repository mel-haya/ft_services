FROM alpine:3.12

ENV TELEGRAF_CONFIG_PATH "/etc/telegraf.conf"
RUN apk update && apk add openrc wget bash influxdb libc6-compat openrc
RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.18.0_linux_amd64.tar.gz
RUN tar xf telegraf-1.18.0_linux_amd64.tar.gz
# RUN cp influxdb2-2.0.4-linux-amd64/{influx,influxd} /usr/local/bin/
COPY srcs/influxdb.conf /etc
COPY srcs/telegraf.conf /etc
COPY srcs/start.sh .
COPY srcs/health.sh .
CMD sh start.sh