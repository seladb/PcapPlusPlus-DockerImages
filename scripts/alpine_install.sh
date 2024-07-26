#!/bin/sh

echo "Install APK for Alpine:${ALPINE_VERSION}"

apk update && apk add --no-cache \
  bash \
  ccache \
  clang \
  clang-extra-tools \
  cmake \
  curl \
  doxygen \
  g++ \
  git \
  libpcap-dev \
  make \
  pkgconfig \
  py-netifaces \
  py3-pip \
  tar \
  wget \
  zstd-dev
  python3 \
  py3-virtualenv \
  python3-dev \
  gcc \
  musl \
  dev \
  linux-headers

apk add tcpreplay \
    --repository=https://dl-cdn.alpinelinux.org/alpine/edge/community
