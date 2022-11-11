variable "region" {
  type    = string
  default = "REGION"
  #default = "eu-amsterdam-1"
}

variable "availability_domain" {
  type    = string
  default = "AD" 
  #default = "Vihs:eu-amsterdam-1-AD-1" 
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

variable "weblogic_wls_image_source_ocid" {
  type    = string
  default = "ocid1.image.oc1..aaaaaaaapr7z57twuh4ornb25ehx7dm4w7vedc6wthewrokbdcyhtfs7bndq"
}

variable "weblogic_wls_shape" {
  type    = string
  default = "VM.Standard.E2.4"
}

variable "weblogic_wls_ssh_public_key" {
  type    = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEA2laLGYCdv26vEQV3U3HqOIBsaW+ZSzsR49RvVfliaTDD+T8QSjgs4f0FxVINFxKHDYNONCl8iOwn7e0kDlrYooezsheKY8eOlaq7okfnVWBliRlFM/ncwKTOZoUVdvyEq/J4/WrQH26oEk24yYHlB2bFArxd+MoTIuoU04W3EIVK9jR4F6mORnUcQX3yFx2QuVBT7aweCDq/DNR3HiAGrMieOMZFvQSoYU8BaHghJnzstpJhmvneDmutp6YKQp7slS6q7Hpchf6LXkhWwSFuv8jpIpW7iqgDxBkqtYL06jzndjrdKvoYQFrb7IKLCxisGlEx0HjRswm3EAk+7CYBXw== rsa-key-20160908"
}

