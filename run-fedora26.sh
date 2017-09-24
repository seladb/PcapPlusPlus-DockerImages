git clone http://github.com/seladb/PcapPlusPlus.git
sudo docker pull seladb/fedora26
sudo docker run -itd --name fedora26 -v $(pwd)/PcapPlusPlus:/PcapPlusPlus seladb/fedora26 bash
sudo docker exec -i fedora26 bash -c "cd PcapPlusPlus && ./configure-linux.sh --default"
sudo docker exec -i fedora26 bash -c "cd PcapPlusPlus && make all"
sudo docker exec -i fedora26 bash -c "cd PcapPlusPlus/Tests/Packet++Test && Bin/Packet++Test"
sudo docker exec -i fedora26 bash -c "cd PcapPlusPlus/Tests/Pcap++Test && Bin/Pcap++Test -n"
