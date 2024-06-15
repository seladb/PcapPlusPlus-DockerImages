#!/bin/sh
set -e

echo "Install DNF for RedHat Enterprise Linux:${RHEL_VERSION}"

if [ -z "${REDHAT_USERNAME}" ] || [ -z "${REDHAT_PASSWORD}" ]; then
  echo "Error: REDHAT_USERNAME and REDHAT_PASSWORD must be set."
  exit 1
fi

# Register the system with Red Hat Subscription Management
subscription-manager register --username "${REDHAT_USERNAME}" --password "${REDHAT_PASSWORD}" --auto-attach

# Install Extra Packages for Enterprise Linux (EPEL)
dnf install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm

# Required system packages
dnf upgrade --refresh -y \
 && dnf install -y --allowerasing \
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
  tcpreplay

# Install pytest
python3 -m pip install -U pip pytest

# Clean up sensitive information after use
subscription-manager unregister
subscription-manager clean
