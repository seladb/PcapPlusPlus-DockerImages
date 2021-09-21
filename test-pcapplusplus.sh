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
    # Find the required configuration - default ,DPDK or PF_RING
    CONFIG_PARAMS="--default"
    if [ "$2" == "dpdk" ]; then
        CONFIG_PARAMS="--dpdk --dpdk-home /dpdk"
    else
        if [ "$2" == "pfring" ]; then
            CONFIG_PARAMS="--pf-ring --pf-ring-home /PF_RING"
        fi
    fi

    # Clone, configure, build and test PcapPlusPlus
    git clone http://github.com/seladb/PcapPlusPlus.git && \
    cd PcapPlusPlus && \
    ./configure-linux.sh $CONFIG_PARAMS && \
    make all && \
    cd Tests/Packet++Test && Bin/Packet++Test $3 && \
    cd ../Pcap++Test && Bin/Pcap++Test -n $3 && \
    cd ../../ && make install && \
    cd Examples/Tutorials/Tutorial-HelloWorld && make -f Makefile.non_windows all && ./Tutorial-HelloWorld

    # This is the end of the part that runs inside the container
    exit
fi

IMAGE=$1

# This cleanup function stops the container
clean_up() {
    docker stop $IMAGE >> /dev/null
}

# Pull the image from DockerHub
docker pull seladb/$IMAGE

# Create a container, mount this script to it
docker run -itd --rm --name $IMAGE -v $(pwd)/test-pcapplusplus.sh:/test-pcapplusplus.sh seladb/$IMAGE bash

# Whatever happens, do cleanup
trap clean_up EXIT

# Look if the image has "dpdk" or "pfring" in it - if so special configuration is required
CONFIG="default"
if [[ $IMAGE == *"dpdk"* ]]; then
    CONFIG="dpdk"
else 
  if [[ $string == *"pfring"* ]]; then
    CONFIG="pfring"
  fi
fi

# Run this script inside the container with a special "build_and_run" argument
docker exec -i $IMAGE bash -c "/test-pcapplusplus.sh build_and_run $CONFIG $2"

echo "SUCCESS!!"
