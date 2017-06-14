echo "export CONFIG=$CONFIG; export PROXY_PORT=28080; cd $(pwd); ./proxy.sh > proxy.log 2>&1 " > /tmp/proxy.sh
start-stop-daemon -p proxy.pid --stop -s 9 || true
./proxy-shutdown.sh || true
start-stop-daemon -p proxy.pid -m -b --start --exec /bin/sh /tmp/proxy.sh
sleep 5s
timeout 30m tail -f proxy.log
