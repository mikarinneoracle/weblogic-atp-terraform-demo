#!/bin/bash
cd db
echo $1 > wallet64
base64 --decode wallet64 > wallet.zip
mkdir -p ./network/admin
mv wallet.zip ./network/admin/

echo "------------- Run sql scripts with a specific version of SQLcli to avoid issues ----------"
wget https://frsxwtjslf35.objectstorage.eu-amsterdam-1.oci.customer-oci.com/p/HQRnyCTvmQXuS9rcttx5HsrSK8Vn-PINn-Rn6WjPMArHjjQmQVuaylSrA-oR2hCM/n/frsxwtjslf35/b/oracledb/o/jdk-11.0.16_linux-x64_bin.tar.gz -q
tar -xzf jdk-11.0.16_linux-x64_bin.tar.gz
export PATH=./jdk-11.0.16/bin:$PATH
export JAVA_HOME=./jdk-11.0.16
wget https://frsxwtjslf35.objectstorage.eu-amsterdam-1.oci.customer-oci.com/p/iwLFugXvt9Ww0CkJxRrYQBOT6YXh-Sofs5mu2-qE-Li_locJC19JBB_iQgV7plmn/n/frsxwtjslf35/b/oracledb/o/V1022102-01.zip -q
unzip -q V1022102-01.zip
./sqlcl/bin/sql -v
echo "-------------------------------------------------------------------------------------------------------------------"
cat ./run.sql
./sqlcl/bin/sql /nolog @./run.sql
