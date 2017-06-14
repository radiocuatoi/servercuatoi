#!/usr/bin/env bash
jre/bin/java -cp "./app/*" -Xms32m -Xmx128m -Xss512k -server -javaagent:newrelic/newrelic.jar -Dfile.encoding=UTF-8 -Djava.net.preferIPv4Stack=true -Duser.timezone=Asia/Ho_Chi_Minh -server us.cuatoi.server.main.ProxyMain
