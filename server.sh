jre/bin/java -cp "./app/*" -Xms128m -Xmx512m -Xss512k -server -javaagent:newrelic/newrelic.jar -Duser.timezone=Asia/Ho_Chi_Minh -server us.cuatoi.server.cloud.CloudServer
