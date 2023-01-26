#!/usr/bin/env bash

cd "$( dirname "${BASH_SOURCE[0]}" )" || exit

echo "------------------------------------"
echo "      install p7z from source       "
echo "------------------------------------"


# install newest version of p7zip
sudo apt-get remove -y p7zip-full

mkdir /tmp/fact_build
cd /tmp/fact_build || exit

wget -O 7zip.tar.bz2 https://sourceforge.net/projects/p7zip/files/latest/download
tar xvjf 7zip.tar.bz2
(cd p7zip* && cp makefile.linux_amd64_asm makefile.linux && make -j"$(nproc)" all3 && sudo ./install.sh)
rm -fr p7zip* 7zip.tar.bz2

exit 0
