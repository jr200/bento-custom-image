# https://github.com/warpstreamlabs/bento/pkgs/container/bento
ARG BENTO_VERSION=1.9.1
FROM ghcr.io/warpstreamlabs/bento:${BENTO_VERSION} as bento

# Pack
FROM python:3.13-alpine3.21 AS package

LABEL maintainer="jr200 <jr200@users.noreply.github.com>"
LABEL org.opencontainers.image.source="https://github.com/jr200/bento-custom-image"

USER root

RUN apk add --no-cache \
    curl jq \
    && pip install --no-cache-dir -U pip boto3

WORKDIR /

COPY --from=bento /etc/ssl/certs/ /etc/ssl/certs/
COPY --from=bento /etc/passwd /etc/passwd
COPY --from=bento /bento /bento

USER bento

EXPOSE 4195

ENTRYPOINT ["/bento"]
