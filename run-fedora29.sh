git clone http://github.com/seladb/PcapPlusPlus.git
sudo docker pull seladb/fedora29
sudo docker run -itd --name fedora29 -v $(pwd)/PcapPlusPlus:/PcapPlusPlus seladb/fedora29 bash
sudo docker exec -i fedora29 bash -c "cd PcapPlusPlus && ./configure-linux.sh --default"
sudo docker exec -i fedora29 bash -c "cd PcapPlusPlus && make all"
sudo docker exec -i fedora29 bash -c "cd PcapPlusPlus/Tests/Packet++Test && Bin/Packet++Test"
sudo docker exec -i fedora29 bash -c "cd PcapPlusPlus/Tests/Pcap++Test && Bin/Pcap++Test -n"
sudo docker exec -i fedora29 bash -c "cd PcapPlusPlus && make install"
sudo docker exec -i fedora29 bash -c "cd PcapPlusPlus/Examples/Tutorials/Tutorial-HelloWorld && make -f Makefile.non_windows all && ./Tutorial-HelloWorld"
