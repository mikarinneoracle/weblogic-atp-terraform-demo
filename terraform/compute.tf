data "template_file" "wls" {
  template = "${file("./scripts/install.sh")}"
}

resource "oci_core_instance" "weblogic_wls" {
  availability_domain = var.availability_domain
  compartment_id      = var.compartment_id
  display_name        = "weblogic"
  shape               = var.weblogic_wls_shape
  freeform_tags = {
    Managed = var.tags
  }

  create_vnic_details {
    assign_private_dns_record = true
    subnet_id                 = oci_core_subnet.Public_Subnet_weblogic.id
    display_name              = "weblogic-VNIC"
    assign_public_ip          = true
    freeform_tags = {
      Managed = var.tags
    }
  }

  source_details {
    source_type = "image"
    source_id   = var.weblogic_wls_image_source_ocid
  }

  metadata = {
    ssh_authorized_keys = var.weblogic_wls_ssh_public_key
    user_data           = base64encode(data.template_file.wls.rendered)
    py_par              = "https://objectstorage.${var.region}.oraclecloud.com${oci_objectstorage_preauthrequest.py_script_preauth.access_uri}"
    wallet_par          = "https://objectstorage.${var.region}.oraclecloud.com${oci_objectstorage_preauthrequest.weblogic_atp_wallet_preauth.access_uri}"
    py2_par             = "https://objectstorage.${var.region}.oraclecloud.com${oci_objectstorage_preauthrequest.py_script2_preauth.access_uri}"
    atp_properties_par = "https://objectstorage.${var.region}.oraclecloud.com${oci_objectstorage_preauthrequest.atp_properties_preauth.access_uri}"
  }
}
