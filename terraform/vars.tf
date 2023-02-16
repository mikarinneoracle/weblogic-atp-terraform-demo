variable "region" {
  type    = string
  default = "REGION"
  #default = "eu-amsterdam-1"
}

variable "availability_domain" {
  type    = string
  default = "AD" 
  #default = "eu-amsterdam-1-AD-1" 
}

"all-ams-services-in-oracle-services-network"

variable "compartment_id" {
  type    = string
  default = "COMPARTMENT_ID"
}

variable "weblogic_atp_admin_password" {
  type    = string
  default = "WelcomeFolks123#!"
}

variable "use_always_free" {
  default = false
}

variable "tags" {
  type    = string
  default = "TF"
}

variable "weblogic_image_source_ocid" {
  type    = string
  default = "ocid1.image.oc1..aaaaaaaapr7z57twuh4ornb25ehx7dm4w7vedc6wthewrokbdcyhtfs7bndq"
}

variable "weblogic_shape" {
  type    = string
  default = "VM.Standard.E4.Flex"
}

variable "weblogic_shape_mem" {
  type    = string
  default = "64"
}

variable "weblogic_shape_ocpus" {
  type    = string
  default = "2"
}
