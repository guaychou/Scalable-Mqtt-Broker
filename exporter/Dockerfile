FROM alpine:latest

COPY mosquitto-exporter /mosquitto-exporter
RUN apk add --no-cache libc6-compat libstdc++
EXPOSE 9234
ENTRYPOINT [ "/mosquitto-exporter" ]