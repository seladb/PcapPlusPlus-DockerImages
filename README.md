# PcapPlusPlus Docker Images

[![Build Status](https://travis-ci.org/seladb/PcapPlusPlus-DockerImages.svg?branch=master)](https://travis-ci.org/seladb/PcapPlusPlus-DockerImages)

This repo contains docker files and scripts to build docker images that are used for testing PcapPlusPlus.

Docker image inventory:

- Ubuntu 14.04
- Ubuntu 16.04
- Ubuntu 18.04
- Fedora 26
- Fedora 29
- CentOS 7
- Ubuntu 16.04 with DPDK 16.11
- Ubuntu 16.04 with DPDK 17.11
- Ubuntu 16.04 with DPDK 18.02
- Ubuntu 16.04 with DPDK 18.11
- Ubuntu 16.04 with DPDK 19.02
- Ubuntu 16.04 with DPDK 19.08
- Ubuntu 16.04 with latest version of PF_RING
- Ubuntu 18.04 with latest version of Doxygen

Travis-CI is used for building the docker images automatically and push them to Docker Hub.

To build a docker image manually please use the following commands:

```shell
PLATFORM=...

docker build -f Dockerfile-${PLATFORM} -t ${PLATFORM} .
docker tag ${PLATFORM} seladb/${PLATFORM}
```

To test PcapPlusPlus with these docker images please use the `run-*.sh` scripts:

```shell
PLATFORM=...

./run-${PLATFORM}.sh
```
