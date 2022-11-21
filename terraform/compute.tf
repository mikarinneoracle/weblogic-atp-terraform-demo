data "template_file" "wls" {
  template = "${file("./scripts/install.sh")}"
}

resource "oci_core_instance" "weblogic_vm" {
  availability_domain = lookup(data.oci_identity_availability_domains.this.availability_domains[0], "name")
  compartment_id      = var.compartment_id
  display_name        = "weblogic"
  shape               = var.weblogic_shape
  freeform_tags = {
    Managed = var.tags
  }
  
  shape_config {
    baseline_ocpu_utilization = "BASELINE_1_1"
    memory_in_gbs     = var.weblogic_shape_mem
    ocpus             = var.weblogic_shape_ocpus
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
    source_id   = var.weblogic_image_source_ocid
  }

  metadata = {
    user_data           = base64encode(data.template_file.wls.rendered)
    py_par              = "https://objectstorage.${var.region}.oraclecloud.com${oci_objectstorage_preauthrequest.py_script_preauth.access_uri}"
    wallet_par          = "https://objectstorage.${var.region}.oraclecloud.com${oci_objectstorage_preauthrequest.weblogic_atp_wallet_preauth.access_uri}"
    py2_par             = "https://objectstorage.${var.region}.oraclecloud.com${oci_objectstorage_preauthrequest.py_script2_preauth.access_uri}"
    atp_properties_par = "https://objectstorage.${var.region}.oraclecloud.com${oci_objectstorage_preauthrequest.atp_properties_preauth.access_uri}"
  }
}
