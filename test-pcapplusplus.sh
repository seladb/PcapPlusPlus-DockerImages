# exit when any command fails
set -e

if [ "$1" == "build_and_run" ]; then
    CONFIG_PARAMS="--default"
    if [ "$2" == "dpdk" ]; then
        CONFIG_PARAMS="--dpdk --dpdk-home /dpdk"
    else
        if [ "$2" == "pfring" ]; then
            CONFIG_PARAMS="--pf-ring --pf-ring-home /PF_RING"
        fi
    fi

    cd PcapPlusPlus && \
    ./configure-linux.sh $CONFIG_PARAMS && \
    make all && \
    cd Tests/Packet++Test && Bin/Packet++Test $3 && \
    cd ../Pcap++Test && Bin/Pcap++Test -n $3 && \
    cd ../../ && make install && \
    cd Examples/Tutorials/Tutorial-HelloWorld && make -f Makefile.non_windows all && ./Tutorial-HelloWorld
    exit
fi

IMAGE=$1

clean_up() {
    docker stop $IMAGE >> /dev/null
    sudo rm -rf PcapPlusPlus
}

docker pull seladb/$IMAGE

if [ -d "PcapPlusPlus" ] ; then
    rm -rf PcapPlusPlus
fi

git clone http://github.com/seladb/PcapPlusPlus.git

sudo docker run -itd --rm --name $IMAGE -v $(pwd)/PcapPlusPlus:/PcapPlusPlus -v $(pwd)/test-pcapplusplus.sh:/test-pcapplusplus.sh seladb/$IMAGE bash
trap clean_up EXIT

CONFIG="default"
if [[ $IMAGE == *"dpdk"* ]]; then
    CONFIG="dpdk"
else 
  if [[ $string == *"pfring"* ]]; then
    CONFIG="pfring"
  fi
fi

sudo docker exec -i $IMAGE bash -c "/test-pcapplusplus.sh build_and_run $CONFIG $2"

echo "SUCCESS!!"
