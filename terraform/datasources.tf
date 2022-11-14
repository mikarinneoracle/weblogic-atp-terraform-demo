data "oci_objectstorage_namespace" "user_namespace" {
  compartment_id = var.compartment_id
}

resource "oci_database_autonomous_database_wallet" "weblogic_atp_wallet" {
  autonomous_database_id = oci_database_autonomous_database.weblogic_atp.id
  password               = "WelcomeFolks123#!"
  base64_encode_content  = true
  generate_type          = "SINGLE"
  provisioner "local-exec" {
    command = "sh db/script.sh ${oci_database_autonomous_database_wallet.autonomous_database_wallet.content}"
  }
}

