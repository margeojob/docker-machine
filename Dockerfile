FROM alpine:3.4
MAINTAINER Thomas Johansen <thxmasj@gmail.com>

ARG VERSION=0.8.1

RUN apk --update add curl ca-certificates && \
        curl -L https://github.com/docker/machine/releases/download/v${VERSION}/docker-machine-`uname -s`-`uname -m` >/usr/local/bin/docker-machine && \
        chmod +x /usr/local/bin/docker-machine && \
        apk del --purge curl && \
        rm -rf /var/cache/apk/*

ENTRYPOINT ["docker-machine"]

