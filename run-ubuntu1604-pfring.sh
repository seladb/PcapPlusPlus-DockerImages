git clone http://github.com/seladb/PcapPlusPlus.git
sudo docker pull seladb/ubuntu1604-pfring
sudo docker run -itd --name ubuntu1604-pfring -v $(pwd)/PcapPlusPlus:/PcapPlusPlus seladb/ubuntu1604-pfring bash
sudo docker exec -i ubuntu1604-pfring bash -c "cd PcapPlusPlus && ./configure-linux.sh --pf-ring --pf-ring-home /PF_RING"
sudo docker exec -i ubuntu1604-pfring bash -c "cd PcapPlusPlus && make all"
sudo docker exec -i ubuntu1604-pfring bash -c "cd PcapPlusPlus/Tests/Packet++Test && Bin/Packet++Test"
sudo docker exec -i ubuntu1604-pfring bash -c "cd PcapPlusPlus/Tests/Pcap++Test && Bin/Pcap++Test -n"
sudo docker exec -i ubuntu1604-pfring bash -c "cd PcapPlusPlus && make install"
sudo docker exec -i ubuntu1604-pfring bash -c "cd PcapPlusPlus/Examples/Tutorials/Tutorial-HelloWorld && make -f Makefile.non_windows all && ./Tutorial-HelloWorld"
