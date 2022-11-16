resource "oci_database_autonomous_database" "weblogic_atp" {
  admin_password           = var.weblogic_atp_admin_password
  is_free_tier             = var.use_always_free
  compartment_id           = var.compartment_id
  db_name                  = "weblogic"
  display_name             = "weblogic-ATP"
  db_workload              = "OLTP"
  is_auto_scaling_enabled  = false
  is_dedicated             = false
  cpu_core_count           = 1
  data_storage_size_in_tbs = 1
  is_preview_version_with_service_terms_accepted = false
  freeform_tags = {
    Managed = var.tags
  }
}
