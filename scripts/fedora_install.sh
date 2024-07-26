#!/bin/sh

echo "Install DNF for Fedora:${FEDORA_VERSION}"

# Required system packages
dnf upgrade -y && dnf install -y \
  ccache \
  cmake \
  curl \
  gcc-c++ \
  git \
  libpcap-devel \
  libstdc++-static \
  pkg-config \
  python3-devel \
  python3-pip \
  unzip \
  wget \
  net-tools \
  tcpreplay \
  python3-virtualenv \
  && dnf groupinstall -y 'Development Tools'

# Install pytest
python3 -m pip install pytest
