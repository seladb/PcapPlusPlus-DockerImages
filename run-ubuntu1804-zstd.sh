git clone http://github.com/seladb/PcapPlusPlus.git
sudo docker pull seladb/ubuntu1804-zstd
sudo docker run -itd --name ubuntu1804-zstd -v $(pwd)/PcapPlusPlus:/PcapPlusPlus seladb/ubuntu1804-zstd bash
sudo docker exec -i ubuntu1804-zstd bash -c "cd PcapPlusPlus && ./configure-linux.sh --use-zstd"
sudo docker exec -i ubuntu1804-zstd bash -c "cd PcapPlusPlus && make all"
sudo docker exec -i ubuntu1804-zstd bash -c "cd PcapPlusPlus/Tests/Packet++Test && Bin/Packet++Test"
sudo docker exec -i ubuntu1804-zstd bash -c "cd PcapPlusPlus/Tests/Pcap++Test && Bin/Pcap++Test -n"
sudo docker exec -i ubuntu1804-zstd bash -c "cd PcapPlusPlus && make install"
sudo docker exec -i ubuntu1804-zstd bash -c "cd PcapPlusPlus/Examples/Tutorials/Tutorial-HelloWorld && make -f Makefile.non_windows all && ./Tutorial-HelloWorld"
