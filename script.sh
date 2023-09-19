compartmentId="<YOUR COMPARTMENT ID>"
region="eu-amsterdam-1"
sshKey="<YOUR OPTIONAL SSH KEY>"
sed -i "s|COMPARTMENT_ID|${compartmentId}|g" terraform/vars.tf
sed -i "s|REGION|${region}|g" terraform/vars.tf
if [ "$sshKey" = "<YOUR OPTIONAL SSH KEY>" ]; then
    sed -i "s|SSH_KEY|""|g" terraform/vars.tf
else
    sed -i "s|SSH_KEY|${sshKey}|g" terraform/vars.tf
fi
echo "Creating Terraform .."
cd terraform
terraform init > tf.out
terraform apply -auto-approve -no-color > ../tf.out &
cd ..
tries=0
OCID=""
while [ $tries -le 100 ] && [[ $OCID == "" ]] 
do
    tail -n 1 tf.out > out.txt
    cat out.txt
    OCID=$(grep -oP '(?<=ocid = ")[^"]*' out.txt)
    tries=$(( $tries + 1 ))
    sleep 10
done
echo "Terraform done. Doing maven build .."
cd app
mvn package -q
echo "Build done. Pushing artifacts .."
cd ..
preauth=$(oci os preauth-request create -bn wls-artifacts --access-type AnyObjectRead --name artifacts-bucket-preauth --time-expires 2024-01-01 | jq '.data."access-uri"' | tr -d '"')
sed -i "s|REGION|$region|g" wls.sh
sed -i "s|SOURCE_URI|$preauth|g" wls.sh
sed -i "s|REGION|$region|g" cmd.json
sed -i "s|COMPARTMENT_ID|${compartmentId}|g" cmd.json
sed -i "s|INSTANCE_OCID|$OCID|g" cmd.json
sed -i "s|SOURCE_URI|$preauth|g" cmd.json
oci os object put --force -bn wls-artifacts --file app/target/app.war
oci os object put --force -bn wls-artifacts --file wls.sh
echo "Pushing artifacts done."
echo "Waiting WLS to start up .. get a coffee ;)"
ip=$(oci compute instance list-vnics --instance-id $OCID | jq -r '.data[]."public-ip"')
spin='-\|/'
tries=0
res=''
i=0
while [ $tries -le 600 ] && [[ $res == '' ]]
do
  i=$(( (i+1) %4 ))
  printf "\r${spin:$i:1}"
  res=$(curl -s http://$ip:7001 | grep TITLE)
  sleep 1
  tries=$(( $tries + 1 ))
done
echo "WebLogic running ... starting app deployment using VM instance-agent ..."
cmd=$(oci instance-agent command create --from-json file://cmd.json | jq '.data.id' | tr -d '"')
tries=0
status=''
i=0
while [ $tries -le 1000 ] && [[ $status != 'SUCCEEDED' ]] 
do
  status=$(oci instance-agent command-execution get --instance-id $OCID --command-id $cmd | jq '.data."lifecycle-state"' | tr -d '"')
  i=$(( (i+1) %4 ))
  printf "\r${spin:$i:1}"
  tries=$(( $tries + 1 ))
  if [ "$status" == "FAILED" ]; then
    echo "Instance-agent deployment failed  .. "
    tries=1001
  fi
done
echo "WebLogic app deployment done."
echo "URL:"
echo "http://$ip:7001/app"
