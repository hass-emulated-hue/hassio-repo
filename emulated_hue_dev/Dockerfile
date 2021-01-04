FROM alpine:latest as downloader

RUN wget -O base.tar.gz https://github.com/hass-emulated-hue/s6-overlay-base/archive/master.tar.gz \
    && mkdir /base \
    && tar zxvf base.tar.gz --strip 1 -C /base


FROM ghcr.io/hass-emulated-hue/base-image:master

# Copy root filesystem
COPY --from=downloader /base/rootfs/ /
COPY --from=downloader /base/rootfs-dev/ /

LABEL io.hass.version="dev"
