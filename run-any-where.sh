#!/bin/sh
kill -9 $(ps aux | grep "us.cuatoi.server.main.TomcatMain" | awk '{print $2}') || true
export DOWNLOAD_DIR="$HOME";
if [ ! -d "${DOWNLOAD_DIR}" ]; then
    echo "${DOWNLOAD_DIR} not found. Using tmp.";
    DOWNLOAD_DIR = "/tmp/";
fi;
find /tmp -ctime +1 -exec rm -rf {} +
find ${DOWNLOAD_DIR} -ctime +1 -exec rm -rf {} +
export DOWNLOAD_DIR="${DOWNLOAD_DIR}/servercuatoi/${RANDOM}"
echo "Downloading to ${DOWNLOAD_DIR}"
if [ ! -d ${DOWNLOAD_DIR} ]; then
    mkdir -p ${DOWNLOAD_DIR}
fi;
cd ${DOWNLOAD_DIR}
rm -rf master.zip
rm -rf servercuatoi-master
wget -q https://github.com/radiocuatoi/servercuatoi/archive/master.zip
unzip master.zip
rm -rf master.zip
cd servercuatoi-master
sh tomcat.sh
