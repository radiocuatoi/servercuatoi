#!/usr/bin/env bash
#Config
export BUILD_ID=dontKillMe;
echo "export CONFIG=$CONFIG;" > /tmp/tomcat.sh;
echo "export PORT=28789;" >> /tmp/tomcat.sh
echo "export BUILD_ID=dontKillMe;" >> /tmp/tomcat.sh
echo "cd $(pwd); ./tomcat-2.sh > /tmp/tomcat-2.log 2>&1" >> /tmp/tomcat.sh
cat /tmp/tomcat.sh;

stop() {
    #Stop old instance
    echo "Stopping instances..."
    touch tomcat.shutdown
    sleep 35s
    start-stop-daemon -p tomcat.pid --stop -s 9 || true;
    kill -9 $(ps aux | grep "us.cuatoi.server2.TomcatMain2" | awk '{print $2}') || true;
    echo "...done";
}

start(){
    #Start old instance
    echo "Starting instances..."
    start-stop-daemon -p tomcat.pid -m -b --start --exec /bin/sh /tmp/tomcat.sh;
    sleep 5s;
    echo "Done..."
    timeout 1m tail -f tomcat.log || true;
}

case "$1" in
  start)
    start
    ;;
  stop)
    stop
    ;;
  restart)
    stop
    start
    ;;
  *)
    echo "Usage: $0 {start|stop|restart}";
    stop
    start
esac;
