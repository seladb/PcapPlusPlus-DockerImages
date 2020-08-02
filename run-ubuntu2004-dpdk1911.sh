git clone http://github.com/seladb/PcapPlusPlus.git
sudo docker pull seladb/ubuntu2004-dpdk1911
sudo docker run -itd --name ubuntu2004-dpdk1911 -v $(pwd)/PcapPlusPlus:/PcapPlusPlus seladb/ubuntu2004-dpdk1911 bash
sudo docker exec -i ubuntu2004-dpdk1911 bash -c "cd PcapPlusPlus && ./configure-linux.sh --dpdk --dpdk-home /dpdk"
sudo docker exec -i ubuntu2004-dpdk1911 bash -c "cd PcapPlusPlus && make all"
sudo docker exec -i ubuntu2004-dpdk1911 bash -c "cd PcapPlusPlus/Tests/Packet++Test && Bin/Packet++Test"
sudo docker exec -i ubuntu2004-dpdk1911 bash -c "cd PcapPlusPlus/Tests/Pcap++Test && Bin/Pcap++Test -n -k 0"
sudo docker exec -i ubuntu2004-dpdk1911 bash -c "cd PcapPlusPlus && make install"
sudo docker exec -i ubuntu2004-dpdk1911 bash -c "cd PcapPlusPlus/Examples/Tutorials/Tutorial-HelloWorld && make -f Makefile.non_windows all && ./Tutorial-HelloWorld"
