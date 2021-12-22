locals {
    default_tags = {
      app = var.context.application_name
      env = var.context.environment_name
    }

    final_tags = merge (local.default_tags, var.tags ) 
}

resource "azurerm_cosmosdb_account" "account" {
  name                = "${var.service_settings.name}-${random_string.random.result}"
  location            = var.context.location
  resource_group_name = var.context.resource_group_name
  offer_type          = var.service_settings.tier
  kind                = var.service_settings.kind

  enable_automatic_failover = true

  enable_multiple_write_locations = var.service_settings.enable_multiregion_write
  is_virtual_network_filter_enabled = var.service_settings.is_virtual_network_filter_enabled
  
  consistency_policy {
    consistency_level       = var.service_settings.consistency_level
  }

  geo_location {
    location          = var.service_settings.failover_location
    failover_priority = 1
  }

  geo_location {
    location          = var.context.location
    failover_priority = 0
  }

  backup {
    type = var.service_settings.backup_type
    interval_in_minutes = var.service_settings.interval_in_minutes
    retention_in_hours = var.service_settings.retention_in_hours
  }

  tags = local.final_tags

}

resource "random_string" "random" {
  length = 8
  special = false
  lower = true
  upper = false
}