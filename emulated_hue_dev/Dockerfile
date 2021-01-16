FROM alpine:latest as downloader
WORKDIR /base

RUN wget -O /tmp/base.tar.gz "https://github.com/hass-emulated-hue/entrypoint/archive/master.tar.gz" \
    && mkdir -p /tmp/base \
    && tar zxvf /tmp/base.tar.gz --strip 1 -C /tmp/base \
    && mv /tmp/base/* .

FROM ghcr.io/hass-emulated-hue/base-image:master

# Copy entrypoint
COPY --from=downloader /base/scripts/ /scripts
COPY --from=downloader /base/dev-scripts/ /scripts

ENTRYPOINT ["/scripts/10-entrypoint.sh"]
