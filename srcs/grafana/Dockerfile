FROM alpine:3.12
RUN apk update && apk add wget bash libc6-compat
RUN wget https://dl.grafana.com/oss/release/grafana-7.4.5.linux-amd64.tar.gz
RUN tar -zxvf grafana-7.4.5.linux-amd64.tar.gz
COPY srcs/start.sh .
COPY srcs/health.sh .
COPY srcs/grafana.db /grafana-7.4.5/data/
CMD sh start.sh