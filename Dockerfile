FROM alpine:latest

RUN \
  apk add --no-cache \
    bash \
    ca-certificates \
    libsasl \
    cyrus-sasl \
    mailx \
    postfix \
    runit \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/main

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
