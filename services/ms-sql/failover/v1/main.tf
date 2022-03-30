locals {
    default_tags = {
      app = var.context.application_name
      env = var.context.environment_name
    }

    final_tags = merge (local.default_tags, var.tags ) 
}



resource "azurerm_mssql_failover_group" "mssql_failover" {
  name      = var.service_settings.name
  server_id = var.service_settings.primary_server_id
  databases = [
    var.service_settings.primary_database_id
  ]

  partner_server {
    id = var.service_settings.secondary_server_id
  }

  read_write_endpoint_failover_policy {
    mode          = var.service_settings.mode
    grace_minutes = var.service_settings.grace_minutes
  }

    tags          = local.final_tags
  
}