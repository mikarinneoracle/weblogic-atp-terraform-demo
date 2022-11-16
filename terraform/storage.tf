resource "oci_objectstorage_bucket" "wls" {
  compartment_id = var.compartment_id
  name           = "wls-create-domain"
  namespace      = data.oci_objectstorage_namespace.user_namespace.namespace
}

resource "oci_objectstorage_object" "weblogic_atp_wallet" {
  bucket    = oci_objectstorage_bucket.wls.name
  content   = oci_database_autonomous_database_wallet.weblogic_atp_wallet.content
  namespace = data.oci_objectstorage_namespace.user_namespace.namespace
  object    = "wallet.zip"
}

resource "oci_objectstorage_preauthrequest" "weblogic_atp_wallet_preauth" {
  access_type  = "ObjectRead"
  bucket       = oci_objectstorage_bucket.wls.name
  name         = "weblogic_atp_wallet_preauth"
  namespace    = data.oci_objectstorage_namespace.user_namespace.namespace
  time_expires = timeadd(timestamp(), "30m")
  object_name = oci_objectstorage_object.weblogic_atp_wallet.object
}

resource "oci_objectstorage_object" "py_script" {
  bucket    = oci_objectstorage_bucket.wls.name
  content   = file("./scripts/create_domain.py")
  namespace = data.oci_objectstorage_namespace.user_namespace.namespace
  object    = "create_domain.py"
}

resource "oci_objectstorage_preauthrequest" "py_script_preauth" {
  access_type  = "ObjectRead"
  bucket       = oci_objectstorage_bucket.wls.name
  name         = "wls_py_script_preauth"
  namespace    = data.oci_objectstorage_namespace.user_namespace.namespace
  time_expires = timeadd(timestamp(), "30m")
  object_name  = oci_objectstorage_object.py_script.object
}

resource "oci_objectstorage_object" "py_script2" {
  bucket    = oci_objectstorage_bucket.wls.name
  content   = file("./scripts/create_datasource_atp.py")
  namespace = data.oci_objectstorage_namespace.user_namespace.namespace
  object    = "create_datasource_atp.py"
}

resource "oci_objectstorage_preauthrequest" "py_script2_preauth" {
  access_type  = "ObjectRead"
  bucket       = oci_objectstorage_bucket.wls.name
  name         = "wls_py_script2_preauth"
  namespace    = data.oci_objectstorage_namespace.user_namespace.namespace
  time_expires = timeadd(timestamp(), "30m")
  object_name  = oci_objectstorage_object.py_script2.object
}

resource "oci_objectstorage_object" "atp_properties" {
  bucket    = oci_objectstorage_bucket.wls.name
  content   = file("./scripts/atp.properties")
  namespace = data.oci_objectstorage_namespace.user_namespace.namespace
  object    = "atp.properties"
}

resource "oci_objectstorage_preauthrequest" "atp_properties_preauth" {
  access_type  = "ObjectRead"
  bucket       = oci_objectstorage_bucket.wls.name
  name         = "atp_properties_preauth"
  namespace    = data.oci_objectstorage_namespace.user_namespace.namespace
  time_expires = timeadd(timestamp(), "30m")
  object_name  = oci_objectstorage_object.atp_properties.object
}

resource "oci_objectstorage_bucket" "artifacts" {
  compartment_id = var.compartment_id
  name           = "wls-artifacts"
  namespace      = data.oci_objectstorage_namespace.user_namespace.namespace
}