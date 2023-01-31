#!/bin/sh

echo "Install DNF for Fedora:${FEDORA_VERSION}"

# Required system packages
dnf upgrade -y && dnf install -y \
  cmake \
  curl \
  gcc-c++ \
  git \
  libpcap-devel \
  libstdc++-static \
  pkg-config \
  unzip \
  wget \
  net-tools \
  tcpreplay \
  && dnf groupinstall -y 'Development Tools'

# Install pytest
python3 -m pip install pytest
