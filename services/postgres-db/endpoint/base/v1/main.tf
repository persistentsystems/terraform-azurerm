locals {
    default_tags = {
      app = var.context.application_name
      env = var.context.environment_name
    }

    final_tags = merge (local.default_tags, var.tags ) 
}
resource "azurerm_postgresql_flexible_server" "postgres_server" {
  name                            = "${var.service_settings.name}-${random_string.random_postgres.result}"
  resource_group_name             = var.context.resource_group_name
  location                        = var.context.location
  version                         = var.service_settings.version
  administrator_login             = var.service_settings.administrator_login
  administrator_password          = var.service_settings.administrator_password
  zone                            = var.service_settings.zone
  storage_mb                      = var.service_settings.storage_mb
  sku_name                        = var.service_settings.sku_name
  backup_retention_days           = var.service_settings.backup_retention_days

  tags = local.final_tags

}

resource "random_string" "random_postgres" {
  length = 8
  special = false
  lower = true
  upper = false
}