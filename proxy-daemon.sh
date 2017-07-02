#!/usr/bin/env bash
#Config
export BUILD_ID=dontKillMe;
echo "export CONFIG=$CONFIG; export PORT=18080; export PROXY_PORT=28080; export BUILD_ID=dontKillMe; cd $(pwd); ./proxy.sh > proxy.log 2>&1 " > /tmp/proxy.sh;
cat /tmp/proxy.sh;

stop() {
    #Stop old instance
    echo "Stopping instances..."
    touch /tmp/proxy.shutdown
    sleep 30s;
    start-stop-daemon -p proxy.pid --stop -s 9 || true;
    kill -9 $(ps aux | grep "us.cuatoi.server.main.ProxyMain" | awk '{print $2}') || true;
    echo "...done";
}

start(){
    #Start old instance
    echo "Starting instances..."
    start-stop-daemon -p proxy.pid -m -b --start --exec /bin/sh /tmp/proxy.sh;
    sleep 10s;
    echo "Done..."
    timeout 1m tail -f proxy.log || true;
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
