# Alpine appears to be having issues with the latest version on RPI
# https://github.com/dperson/openvpn-client/issues/365#issuecomment-787133320
# Use 3.12 for now until the issue is resolved upstream
FROM alpine:3.12 as downloader
WORKDIR /base

RUN wget -O /tmp/base.tar.gz "https://github.com/hass-emulated-hue/core/archive/master.tar.gz" \
    && mkdir -p /tmp/base \
    && tar zxvf /tmp/base.tar.gz --strip 1 -C /tmp/base \
    && mv /tmp/base/* .

FROM ghcr.io/hass-emulated-hue/core:refactor

# Copy root filesystem
COPY --from=downloader /base/docker/rootfs-dev/ /

# Remove existing installation
RUN rm -rf emulated_hue
