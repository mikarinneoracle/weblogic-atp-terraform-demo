#!/bin/bash

get_object() {
    out_file=$1
    os_uri=$2
    success=1
    for i in $(seq 1 9); do
        echo "trying ($i) $2"
        http_status=$(curl -w '%%{http_code}' -L -s -o $1 $2)
        if [ "$http_status" -eq "200" ]; then
            success=0
            echo "saved to $1"
            break 
        else
             sleep 15
        fi
    done
    return $success
}

echo "ocarun ALL=(ALL) NOPASSWD:ALL" > /tmp/101-oracle-cloud-agent-run-command
sudo cp /tmp/101-oracle-cloud-agent-run-command /etc/sudoers.d/

sudo firewall-offline-cmd -q --add-port=7001/tcp
sudo systemctl restart firewalld

mkdir /home/oracle/wallet
WALLET_URI=$(curl -L http://169.254.169.254/opc/v1/instance/metadata | jq -j ".wallet_par")
get_object /home/oracle/wallet/Wallet.64 $${WALLET_URI}
cd /home/oracle/wallet
base64 --decode Wallet.64 > Wallet.zip
unzip Wallet.zip
sed -i "s|"?/network/admin"|"/home/oracle/wallet/"|g" sqlnet.ora
rm -f Wallet.zip
zip Wallet.zip *
cd ..
sudo chown -R oracle:oracle /home/oracle/wallet

PY_URI=$(curl -L http://169.254.169.254/opc/v1/instance/metadata | jq -j ".py_par")
get_object /home/oracle/create_domain.py $${PY_URI}
sudo chown oracle:oracle /home/oracle/create_domain.py

PY2_URI=$(curl -L http://169.254.169.254/opc/v1/instance/metadata | jq -j ".py2_par")
get_object /home/oracle/create_datasource_atp.py $${PY2_URI}
sudo chown oracle:oracle /home/oracle/create_datasource_atp.py

PROPS_URI=$(curl -L http://169.254.169.254/opc/v1/instance/metadata | jq -j ".atp_properties_par")
get_object /home/oracle/atp.properties $${PROPS_URI}
sudo chown oracle:oracle /home/oracle/atp.properties

sudo su oracle

unzip /u01/zips/jcs/JDK8.0/jdk.zip -d /

unzip /u01/zips/jcs/FMW/12.2.1.4.0/fmiddleware.zip -d /

chmod -R 775 /u01/

. /u01/app/oracle/middleware/wlserver/server/bin/setWLSEnv.sh
java weblogic.WLST /home/oracle/create_domain.py

cd /u01/app/oracle/middleware/wlserver/user_projects/domains/webapp/
./startWebLogic.sh &

sleep 120

java weblogic.WLST /home/oracle/create_datasource_atp.py
