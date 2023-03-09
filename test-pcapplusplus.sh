#!/bin/bash

# Usage:
# ------
# ./test-pcapplusplus.sh IMAGE [OPTIONAL_TEST_PARAMS]
#
# For example:
# ./test-pcapplusplus.sh ubuntu2004-dpdk1911
# ./test-pcapplusplus.sh centos7 -s


# exit when any command fails
set -e

# This part runs only inside the container - the script runs itelsf inside the container
if [ "$1" == "build_and_run" ]; then
    # Find the required CMake configuration None, DPDK or PF_RING
    if [ "$2" == "dpdk" ]; then
        CONFIG_PARAMS=("-D PCAPPP_USE_DPDK=ON")
    elif [ "$2" == "pfring" ]; then
        CONFIG_PARAMS=("-D PCAPPP_USE_PF_RING=ON" "-D PF_RING_ROOT='/PF_RING'")
    fi

    # Clone, configure, build and test PcapPlusPlus
    git clone http://github.com/seladb/PcapPlusPlus.git
    cd PcapPlusPlus

    # Build Pcap++
    cmake ${CONFIG_PARAMS[@]} -S . -B build
    cmake --build build -j

    # Run quick tests
    (cd Tests/Packet++Test && Bin/Packet++Test $3)
    (cd Tests/Pcap++Test && Bin/Pcap++Test -n $3)

    # Install Pcap++
    cmake --install build

    # Build Tutorial
    cmake ${CONFIG_PARAMS[@]} -S Examples/Tutorials/Tutorial-HelloWorld/ -B build_tutorial
    cmake --build build_tutorial -j

    # This is the end of the part that runs inside the container
    exit
fi

IMAGE=$1

# This cleanup function stops the container
clean_up() {
    docker stop $IMAGE >> /dev/null
}

# Pull the image from DockerHub
# docker pull seladb/$IMAGE

# Create a container, mount this script to it
docker run -itd --rm --name $IMAGE -v $(pwd)/test-pcapplusplus.sh:/test-pcapplusplus.sh seladb/$IMAGE bash

# Whatever happens, do cleanup
trap clean_up EXIT

# Look if the image has "dpdk" or "pfring" in it - if so special configuration is required
CONFIG="default"
if [[ $IMAGE == *"dpdk"* ]]; then
    CONFIG="dpdk"
elif [[ $IMAGE == *"pfring"* ]]; then
    CONFIG="pfring"
fi

# Run this script inside the container with a special "build_and_run" argument
docker exec -i $IMAGE bash -c "/test-pcapplusplus.sh build_and_run $CONFIG $2"

echo "SUCCESS!!"
