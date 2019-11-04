FROM alpine:latest
LABEL maintainer="kevinchou" appname="Mosquitto Message Broker"
RUN apk add --no-cache mosquitto mosquitto-clients
EXPOSE 1883
ENTRYPOINT ["/usr/sbin/mosquitto"]