git clone http://github.com/seladb/PcapPlusPlus.git
git clone https://github.com/PcapPlusPlus/pcapplusplus.github.io.git
sudo docker pull seladb/doxygen
cd PcapPlusPlus
./configure-linux.sh --default
make all
cd ..
sudo docker run -itd --name doxygen -v $(pwd)/PcapPlusPlus:/PcapPlusPlus -v $(pwd)/pcapplusplus.github.io:/pcapplusplus.github.io seladb/doxygen bash
sudo docker exec -i doxygen bash -c "cd /pcapplusplus.github.io/api-docs/doxygen && doxygen Doxyfile-ci"