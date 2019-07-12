#!/bin/bash
set -eux

# Install system dependencies

apt-get update
apt-get install --yes --no-install-recommends \
  fonts-texgyre \
  lmodern \
  nano \
  texlive-fonts-extra \
  texlive-fonts-recommended \
  time
