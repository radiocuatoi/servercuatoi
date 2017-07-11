#!/usr/bin/env bash
export JAVA_OPTS=" $JAVA_OPTS -Xss512k -Xms128m -Xmx384m ";
export JAVA_OPTS=" $JAVA_OPTS -server -javaagent:../newrelic/newrelic.jar "
export JAVA_OPTS=" $JAVA_OPTS -Dfile.encoding=UTF-8 -Djava.net.preferIPv4Stack=true -Duser.timezone=Asia/Ho_Chi_Minh "
../jre/bin/java -cp "../app/*" ${JAVA_OPTS} $1
