variable "region" {
  type    = string
  default = "REGION"
  #default = "eu-amsterdam-1"
}

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
  default = "ocid1.image.oc1..aaaaaaaasog76b3c6bpzvhliybfv54tqdf7vg3hxhflabww2jly6fmksi6pa"
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

variable "ssh_public_key" {
  type    = string
  default = "SSH_KEY"
}