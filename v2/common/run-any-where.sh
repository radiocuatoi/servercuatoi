#!/bin/sh
export DOWNLOAD_DIR="/tmp/servercuatoi";
echo "Downloading to ${DOWNLOAD_DIR}";
rm -rf ${DOWNLOAD_DIR};
mkdir -p ${DOWNLOAD_DIR};
cd ${DOWNLOAD_DIR};
wget -q https://github.com/radiocuatoi/servercuatoi/archive/master.zip;
unzip -q master.zip;
rm -rf master.zip;
echo "Downloaded to ${DOWNLOAD_DIR}";
cd servercuatoi-master/v2;
sh ${COMMAND} ${PARAM};

