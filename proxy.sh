#!/usr/bin/env bash
jre/bin/java -cp "./app/*" -Xss512k -Xms32m -Xmx64m -server -javaagent:newrelic/newrelic.jar -Dfile.encoding=UTF-8 -Djava.net.preferIPv4Stack=true -Duser.timezone=Asia/Ho_Chi_Minh -server us.cuatoi.server.main.ProxyMain
