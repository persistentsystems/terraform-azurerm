
resource "azurerm_cosmosdb_account" "account" {

  name                      = "cosmos-${var.service_settings.name}"
  location                  = var.context.location.name
  resource_group_name       = var.context.resource_group_name
  offer_type                = var.service_settings.tier
  kind                      = var.service_settings.kind

  enable_automatic_failover = var.service_settings.automatic_failover

  consistency_policy {
    consistency_level       = var.service_settings.consistency_level
  }

  /*

  dynamic "metric" {
    for_each = var.service_settings.metrics
      content {
        
        category = metric.value
        retention_policy {
          enabled = true
          days = var.observability_settings.retention_policy.long_term
        }

      }
  }
  */
  
  dynamic "geo_location" {
    for_each = var.service_settings.locations
      content {
        
        location          = geo_location.value.name
        failover_priority = geo_location.value.priority

      }
  }
  
  tags = {
    app = var.context.application_name
    env = var.context.environment_name
  }

}