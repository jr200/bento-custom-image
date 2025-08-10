# https://github.com/warpstreamlabs/bento/pkgs/container/bento
ARG BENTO_VERSION=1.9.1
FROM ghcr.io/warpstreamlabs/bento:${BENTO_VERSION} as bento

# Pack
FROM python:3.13-slim-bookworm AS package

LABEL maintainer="jr200 <jr200@users.noreply.github.com>"
LABEL org.opencontainers.image.source="https://github.com/jr200/bento-custom-image"

USER root

COPY --from=bento /etc/ssl/certs/ /etc/ssl/certs/
COPY --from=bento /etc/passwd /etc/passwd
COPY --from=bento /bento /bento

RUN apt update && apt install --no-install-recommends -y curl && \
    apt clean && rm -rf /var/lib/apt/lists/* && \
    pip install --no-cache-dir -U pip boto3 polars fastapi uvicorn

WORKDIR /

COPY docker/docker-entrypoint.sh /docker-entrypoint.sh
COPY docker/scripts/ /scripts

USER bento

EXPOSE 4195

ENTRYPOINT ["/docker-entrypoint.sh"]
