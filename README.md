# PcapPlusPlus Docker Images

[![Docker Image CI](https://github.com/seladb/PcapPlusPlus-DockerImages/actions/workflows/docker-image.yml/badge.svg)](https://github.com/seladb/PcapPlusPlus-DockerImages/actions/workflows/docker-image.yml)

This repo contains docker files and scripts to build docker images that are used for testing PcapPlusPlus.

Docker image inventory:

Maintained images (can be updated by CI)
- Ubuntu 16.04
- Ubuntu 18.04
- Ubuntu 20.04
- Fedora 29
- CentOS 7
- Ubuntu 20.04 with DPDK 19.11
- Ubuntu 20.04 with latest version of PF_RING
- Ubuntu 18.04 with Zstd v1.4.4

Legacy images (cannot or shouldn't be updated by CI)
- Ubuntu 14.04
- Fedora 26
- Ubuntu 16.04 with DPDK 16.11
- Ubuntu 16.04 with DPDK 17.11
- Ubuntu 16.04 with DPDK 18.02
- Ubuntu 16.04 with DPDK 18.11
- Ubuntu 16.04 with DPDK 19.02
- Ubuntu 16.04 with DPDK 19.08
- Ubuntu 18.04 with DPDK 19.11
- Ubuntu 16.04 with latest version of PF_RING

GitHub Actions is used for building the docker images automatically and push them to Docker Hub.

To build a docker image manually please use the following commands:

```shell
PLATFORM=...

docker build . --file Dockerfile-${PLATFORM} --tag seladb/${PLATFORM}:latest
```

To test PcapPlusPlus with these docker images please use the `run-*.sh` scripts:

```shell
PLATFORM=...

./run-${PLATFORM}.sh
```
