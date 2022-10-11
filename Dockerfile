FROM alpine:latest

LABEL org.opencontainers.image.source https://github.com/10up/postfix
LABEL org.opencontainers.image.documentation https://github.com/10up/postfix/blob/trunk/README.md

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
