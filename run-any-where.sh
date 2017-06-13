#!/bin/sh
export DOWNLOAD_DIR="$HOME";
if [ ! -d "${DOWNLOAD_DIR}" ]; then
    echo "${DOWNLOAD_DIR} not found. Using tmp.";
    DOWNLOAD_DIR = "/tmp/";
fi;
export DOWNLOAD_DIR="${DOWNLOAD_DIR}/servercuatoi"
echo "Downloading to ${DOWNLOAD_DIR}"
if [ ! -d ${DOWNLOAD_DIR} ]; then
    mkdir -p ${DOWNLOAD_DIR}
fi;
cd ${DOWNLOAD_DIR}
rm -rf master.zip
rm -rf servercuatoi-master
wget https://github.com/radiocuatoi/servercuatoi/archive/master.zip
unzip master.zip
rm -rf master.zip
cd servercuatoi-master
sh server.sh