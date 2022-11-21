echo "Deleting Terraform .."
export par=$(oci os preauth-request list -bn wls-artifacts | jq '.data[].id' | tr -d '"')
oci os preauth-request delete -bn wls-artifacts --par-id $par --force
oci os object bulk-delete -bn wls-artifacts --force
oci os object bulk-delete -bn wls-create-domain --force
cd terraform
terraform destroy -auto-approve
cd
rm -f out.txt
rm -f tf.out

