FROM alpine:latest
MAINTAINER Thomas Johansen <thxmasj@gmail.com>

ARG VERSION=0.8.2

RUN apk --update add --no-cache curl ca-certificates && \
        curl -L https://github.com/docker/machine/releases/download/v${VERSION}/docker-machine-`uname -s`-`uname -m` >/usr/local/bin/docker-machine && \
        chmod +x /usr/local/bin/docker-machine && \
        apk del --purge curl

ENTRYPOINT ["docker-machine"]

