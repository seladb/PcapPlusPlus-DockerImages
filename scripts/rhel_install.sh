#!/bin/sh

echo "Install DNF for RedHat Enterprise Linux:${RHEL_VERSION}"

# Install Extra Packages for Enterprise Linux (EPEL)
dnf install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm

# TCPDump not present on RHEL? required by tcpreplay
dnf install -y https://dl.rockylinux.org/pub/rocky/9/AppStream/$(arch)/os/Packages/t/tcpdump-4.99.0-7.el9.$(arch).rpm

# Required system packages
dnf upgrade -y && dnf install -y --allowerasing \
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
  && dnf groupinstall -y 'Development Tools'

# Install pytest
python3 -m pip install pytest
