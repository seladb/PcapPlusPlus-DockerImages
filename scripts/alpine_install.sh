#!/bin/sh

echo "Install APK for Alpine:${ALPINE_VERSION}"

apk update && apk add --no-cache \
  bash \
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

apk add tcpreplay \
    --repository=https://dl-cdn.alpinelinux.org/alpine/edge/testing
