#!/bin/bash
wget https://cdn.kernel.org/pub/linux/kernel/v4.x/linux-4.16.tar.xz
tar xvJf linux-4.16.tar.xz
sudo apt-get install libncurses5-dev libncursesw5-dev
sudo apt-get install libssl-dev
make menuconfig
#save default config in a .config file

#compiling min kernel
make 

#compiling kernel modules
make modules

#installing kernel modules
sudo make modules_install

#kernel install
sudo make install
