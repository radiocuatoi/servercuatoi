#!/usr/bin/env bash
#Check config is set
if [ -z "$CONFIG" ]; then
    echo "Please set config."
    exit 0;
fi;

run(){
    common/run.sh ${CLASS_S};
}

start(){
    echo "Starting..."
    export BUILD_ID=dontKillMe;
    echo "export CONFIG=$CONFIG;" > /tmp/${NAME_S}.sh;
    echo "export PORT=$PORT_S;" >> /tmp/${NAME_S}.sh
    echo "export PROXY_PORT=$PROXY_PORT_S;" >> /tmp/${NAME_S}.sh
    echo "export BUILD_ID=dontKillMe;" >> /tmp/${NAME_S}.sh
    echo "cd $(pwd); common/run.sh ${CLASS_S} > /tmp/${NAME_S}.log 2>&1" >> /tmp/${NAME_S}.sh
    cat /tmp/${NAME_S}.sh;

    start-stop-daemon -p /tmp/${NAME_S}.pid -m -b --start --exec /bin/sh /tmp/${NAME_S}.sh;
    sleep 5s;
    echo "Done..."
    timeout 1m tail -f /tmp/${NAME_S}.log || true;
}

stop(){
    echo "Stopping instances..."
    touch /tmp/${NAME_S}.shutdown;
    sleep 20s
    start-stop-daemon -p /tmp/${NAME_S}.pid --stop -s 9 || true;
    kill -9 $(ps aux | grep "$CLASS_S" | awk '{print $2}') || true;
    echo "...done";
}

check(){
    curl -m 5 -s http://localhost:${PORT_S} > /dev/null;
    if (( $? > 0 )); then
        echo "App down. Starting..."
        start
    else
        echo "Application is running on port $PORT_S"
    fi;
}

case "$1" in
  run)
    run
    ;;
  check)
    check
    ;;
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
    echo "Usage: {run|check|start|stop|restart}";
esac;
