data "oci_core_services" "weblogic_services" {
}

resource "oci_core_vcn" "weblogic_vcn" {
  compartment_id = var.compartment_id
  cidr_block     = "10.0.0.0/16"
  display_name   = "weblogic-VCN"
  dns_label      = "weblogic"
  freeform_tags = {
    Managed = var.tags
  }
}

resource "oci_core_internet_gateway" "weblogic_IG" {
  compartment_id = var.compartment_id
  display_name = "Internet Gateway-wls"
  enabled      = "true"
  freeform_tags = {
    Managed = var.tags
  }
  vcn_id = oci_core_vcn.weblogic_vcn.id
}

resource "oci_core_default_route_table" "weblogic_public_rt" {
  compartment_id = var.compartment_id
  display_name = "Default Route Table for wls"
  freeform_tags = {
    Managed = var.tags
  }
  manage_default_resource_id = oci_core_vcn.weblogic_vcn.default_route_table_id
  
  route_rules {
    description = "Internet Gateway"
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.weblogic_IG.id
  }
}

resource "oci_core_security_list" "weblogic_security_list_public" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.weblogic_vcn.id
  display_name   = "Security list for WebLogic public subnet"

  egress_security_rules {
    destination      = "0.0.0.0/0"
    protocol         = "all"
    destination_type = "CIDR_BLOCK"
  }

  ingress_security_rules {
    protocol = "1"
    source   = "0.0.0.0/0"
    icmp_options {
      type = "3"
      code = "4"
    }
    source_type = "CIDR_BLOCK"
  }

  ingress_security_rules {
    protocol = "6"
    source   = "0.0.0.0/0"
    tcp_options {
      max = "22"
      min = "22"
    }
    source_type = "CIDR_BLOCK"
  }

  ingress_security_rules {
    protocol = "6"
    source   = "0.0.0.0/0"
    tcp_options {
      max = "7002"
      min = "7001"
    }
    source_type = "CIDR_BLOCK"
  }

  freeform_tags = {
    Managed = var.tags
  }
}

resource "oci_core_subnet" "Public_Subnet_weblogic" {
  vcn_id              = oci_core_vcn.weblogic_vcn.id
  cidr_block          = "10.0.0.0/24"
  compartment_id      = var.compartment_id
  display_name        = "Public Subnet-wls"
  freeform_tags       = {
    Managed = var.tags
  }
  security_list_ids = [
     oci_core_security_list.weblogic_security_list_public.id
  ]
  prohibit_internet_ingress  = "false"
  prohibit_public_ip_on_vnic = "false"
  route_table_id             = oci_core_default_route_table.weblogic_public_rt.id
}
