resource "azurerm_mssql_database" "test" {
  name           = var.service_settings.name
  server_id      = var.service_settings.server_id
  collation      = var.service_settings.collation
  license_type   = var.service_settings.license_type
  max_size_gb    = var.service_settings.max_size_gb
  read_scale     = var.service_settings.read_scale
  sku_name       = var.service_settings.sku_name
  zone_redundant = var.service_settings.zone_redundant

  extended_auditing_policy {
    storage_endpoint                        = var.service_settings.storage_endpoint
    storage_account_access_key              = var.service_settings.storage_account_access_key
    retention_in_days                       = var.service_settings.retention_in_days
  }


  tags = {
    tags = local.final_tags
  }

}

