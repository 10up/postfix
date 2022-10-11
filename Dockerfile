FROM alpine:latest

LABEL org.opencontainers.image.source https://github.com/10up/postfix

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
