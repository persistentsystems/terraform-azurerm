locals {
    default_tags = {
      app = var.context.application_name
      env = var.context.environment_name
    }

    final_tags = merge (local.default_tags, var.tags ) 
}


resource "azurerm_mssql_database" "mssql-db" {
  name           = var.service_settings.name
  server_id      = var.service_settings.server_id
  collation      = var.service_settings.collation 
  max_size_gb    = var.service_settings.max_size_gb
  sku_name       = var.service_settings.sku_name
  auto_pause_delay_in_minutes = var.service_settings.auto_pause_delay_in_minutes
  min_capacity    = var.service_settings.min_capacity

  tags                      = local.final_tags

}

