git clone http://github.com/seladb/PcapPlusPlus.git
git clone https://github.com/PcapPlusPlus/pcapplusplus.github.io.git
sudo docker pull seladb/ubuntu1804
cd PcapPlusPlus
./configure-linux.sh --default
make all
cd ..
sudo docker run -itd --name ubuntu1804 -v $(pwd)/PcapPlusPlus:/PcapPlusPlus -v $(pwd)/pcapplusplus.github.io:/pcapplusplus.github.io seladb/ubuntu1804 bash
sudo docker exec -i ubuntu1804 bash -c "cd /pcapplusplus.github.io/api-docs/doxygen && doxygen Doxyfile-ci"