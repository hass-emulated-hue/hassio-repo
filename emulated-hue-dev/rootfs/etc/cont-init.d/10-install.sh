#!/usr/bin/with-contenv bashio
# ==============================================================================
# Community Hass.io Add-ons: Emulated Hue
# This file installs the Emulated Hue version if specified
# ==============================================================================

declare release_version

if bashio::config.has_value 'tag_commit_or_branch'; then
    release_version=$(bashio::config 'tag_commit_or_branch')
    if [[ $release_version == *":"* ]]; then
      IFS=':' read -r -a array <<< "$release_version"
      username=${array[0]}
      ref=${array[1]}
    else
      username="hass-emulated-hue"
      ref=$release_version
    fi
    full_url="https://github.com/${username}/core/archive/${ref}.zip"
    bashio::log.info "Installing Emulated Hue version '${release_version}' (${full_url})..."
    curl -Lo /tmp/emulator.zip "${full_url}"
    inner_folder=`unzip -qql /tmp/emulator.zip | head -n1 | tr -s ' ' | cut -d' ' -f5-`
    unzip /tmp/emulator.zip -d /tmp/emulator
    rm -rf /app/*
    mv "/tmp/emulator/${inner_folder}/emulated_hue" "/app/"
    bashio::log.info "Installed successfully!"
fi
