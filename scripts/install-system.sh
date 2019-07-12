#!/bin/bash
set -eux

# Install system dependencies

apt-get update
apt-get install --yes --no-install-recommends \
  nano \
  time
