FROM alpine:3.10
LABEL maintainer="kevinchou" appname="Mosquitto Message Broker"
RUN apk add --no-cache libc6-compat libstdc++ mosquitto mosquitto-clients
COPY mosquitto-exporter /mosquitto-exporter
COPY entrypoint.sh /entrypoint.sh
EXPOSE 1883 9234
ENTRYPOINT [ "/entrypoint.sh" ]