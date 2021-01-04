#!/usr/bin/with-contenv bashio
# ==============================================================================
# Community Hass.io Add-ons: Emulated Hue
# This file installs the Emulated Hue version if specified
# ==============================================================================

declare release_version

if bashio::config.has_value 'tag_commit_or_branch'; then
    release_version=$(bashio::config 'tag_commit_or_branch')
else
    release_version=${TAG_COMMIT_OR_BRANCH:-master}
fi

if [[ $release_version == *":"* ]]; then
  IFS=':' read -r -a array <<< "$release_version"
  username=${array[0]}
  ref=${array[1]}
else
  username="hass-emulated-hue"
  ref=$release_version
fi
full_url="https://github.com/${username}/core/archive/${ref}.tar.gz"
bashio::log.info "Installing Emulated Hue version '${release_version}' (${full_url})..."
curl -Lo /tmp/emulator.tar.gz "${full_url}"
mkdir /tmp/emulator
tar zxvf /tmp/emulator.tar.gz --strip 1 -C /tmp/emulator
rm -rf /app/emulated_hue
mkdir /app
mv /tmp/emulator/emulated_hue /app/emulated_hue
bashio::log.info "Installed successfully!"
