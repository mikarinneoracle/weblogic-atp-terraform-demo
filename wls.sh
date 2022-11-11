if [ -f "/tmp/app.war" ]; then
  sudo rm -rf /tmp/app.war
fi

wget -q https://objectstorage.REGION.oraclecloud.comSOURCE_URIapp.war -O /tmp/app.war

sudo su oracle

. /u01/app/oracle/middleware/wlserver/server/bin/setWLSEnv.sh

java weblogic.Deployer -adminurl 127.0.0.1:7001 -username weblogic -password Welcome1 -undeploy -name webapp

java weblogic.Deployer -adminurl 127.0.0.1:7001 -username weblogic -password Welcome1 -deploy -name webapp /tmp/app.war
