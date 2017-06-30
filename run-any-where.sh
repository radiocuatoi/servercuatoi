#!/bin/sh
kill -9 $(ps aux | grep "us.cuatoi.server.main.TomcatMain" | awk '{print $2}') || true
export DOWNLOAD_DIR="/tmp/servercuatoi";
find /tmp/ -ctime +1 -exec rm -rf {} +
echo "Downloading to ${DOWNLOAD_DIR}"
rm -rf ${DOWNLOAD_DIR}
mkdir -p ${DOWNLOAD_DIR}
cd ${DOWNLOAD_DIR}
wget -q https://github.com/radiocuatoi/servercuatoi/archive/master.zip
unzip -q master.zip
rm -rf master.zip
cd servercuatoi-master
sh tomcat.sh
