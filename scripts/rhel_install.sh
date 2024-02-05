#!/bin/sh
CMAKE_VERSION="3.28.3"

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
  openssl-devel \
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

# Update CMake (3.22+ required for packaging)
wget https://github.com/Kitware/CMake/releases/download/v${CMAKE_VERSION}/cmake-${CMAKE_VERSION}.tar.gz \
	&& tar xzf cmake-${CMAKE_VERSION}.tar.gz \
	&& cd cmake-${CMAKE_VERSION} \
	&& ./bootstrap --prefix=/usr/local \
	&& make -j$(nproc) && make install \
	&& cd .. && rm -rf cmake-${CMAKE_VERSION}*
