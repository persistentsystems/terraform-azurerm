locals {
    default_tags = {
      app = var.context.application_name
      env = var.context.environment_name
    }

    final_tags = merge (local.default_tags, var.tags ) 
}


resource "azurerm_mssql_elasticpool" "mssql-db" {
  name                = var.service_settings.name
  resource_group_name = var.context.resource_group_name
  location            = var.context.location
  server_name         = var.service_settings.server_name
  license_type        = var.service_settings.license_type
  max_size_gb         = var.service_settings.max_size_gb   
  zone_redundant      = var.service_settings.zone_redundant
  sku  {
    name         = var.service_settings.sku_name
    tier         = var.service_settings.tier
    family       = var.service_settings.family
    capacity     = var.service_settings.capacity
  } 
  per_database_settings {
    min_capacity = var.service_settings.min_capacity
    max_capacity = var.service_settings.max_capacity
  }
  tags                      = local.final_tags

}

