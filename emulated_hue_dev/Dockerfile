FROM alpine:latest as downloader
WORKDIR /base

RUN wget -O /tmp/base.tar.gz "https://github.com/hass-emulated-hue/s6-overlay-base/archive/master.tar.gz" \
    && mkdir -p /tmp/base \
    && tar zxvf /tmp/base.tar.gz --strip 1 -C /tmp/base \
    && mv /tmp/base/* .

FROM ghcr.io/hass-emulated-hue/base-image:master

# Copy root filesystem
COPY --from=downloader /base/rootfs/ /
COPY --from=downloader /base/rootfs-dev/ /
