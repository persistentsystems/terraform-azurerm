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
  
  tags = local.final_tags

}

resource "random_string" "random" {
  length = 8
  special = false
  lower = true
  upper = false
}