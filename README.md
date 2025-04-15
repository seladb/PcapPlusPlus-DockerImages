# PcapPlusPlus Docker Images

[![Docker Image CI](https://github.com/seladb/PcapPlusPlus-DockerImages/actions/workflows/docker-image.yml/badge.svg)](https://github.com/seladb/PcapPlusPlus-DockerImages/actions/workflows/docker-image.yml)

This repo contains docker files and scripts to build docker images that are used for testing PcapPlusPlus.

Docker image inventory:

Maintained images (can be updated by CI)
- CentOS 7
- CentOS Stream 9
- Alpine 3.20
- Fedora 40
- RHEL 9.4
- Ubuntu 20.04
- Ubuntu 20.04 with the latest version of PF_RING
- Ubuntu 20.04 with Zstd v1.5.2
- Ubuntu 22.04
- Ubuntu 22.04 with ICPX
- Ubuntu 22.04 with DPDK 22.11
- Ubuntu 24.04
- Ubuntu 24.04 with DPDK 23.11
- Ubuntu 24.04 with DPDK 24.11

Legacy images (cannot or shouldn't be updated by CI)
- CentOS 8
- Fedora 26
- Fedora 29
- Fedora 34
- Fedora 38
- Fedora 39
- Alpine 3.15
- Alpine 3.19
- Ubuntu 14.04
- Ubuntu 16.04
- Ubuntu 16.04 with DPDK 16.11
- Ubuntu 16.04 with DPDK 17.11
- Ubuntu 16.04 with DPDK 18.02
- Ubuntu 16.04 with DPDK 18.11
- Ubuntu 16.04 with DPDK 19.02
- Ubuntu 16.04 with DPDK 19.08
- Ubuntu 16.04 with latest version of PF_RING
- Ubuntu 18.04
- Ubuntu 18.04 with DPDK 19.11
- Ubuntu 18.04 with Zstd v1.4.4
- Ubuntu 20.04 with DPDK 19.11
- Ubuntu 20.04 with DPDK 20.11
- Ubuntu 20.04 with DPDK 21.11


GitHub Actions is used for building the docker images automatically and push them to Docker Hub.

To build a docker image manually please use the following commands:

```shell
PLATFORM=...

docker build . --file Dockerfile-${PLATFORM} --tag seladb/${PLATFORM}:latest
```

To test PcapPlusPlus with these docker images please use the `test-pcapplusplus.sh` script:

```shell
./test-pcapplusplus.sh IMAGE [OPTIONAL_TEST_PARAMS]
```

For example:

```shell
./test-pcapplusplus.sh ubuntu2004-dpdk1911

./test-pcapplusplus.sh centos7 -s
```
