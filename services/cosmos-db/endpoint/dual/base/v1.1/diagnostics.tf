resource "azurerm_monitor_diagnostic_setting" "frontdoor_diagnostic_setting" {

  name                        = "${var.service_settings.name}-cosmosdb-logs"
  target_resource_id          = azurerm_cosmosdb_account.account.id
  log_analytics_workspace_id  = var.service_settings.workspace_id

  log {
    category = "DataPlaneRequests"
    enabled  = true

    retention_policy {
      enabled = true
    }
  }
  log {
    category = "MongoRequests"
    enabled  = true

    retention_policy {
      enabled = true
    }
  }
  log {
    category = "QueryRuntimeStatistics"
    enabled  = true

    retention_policy {
      enabled = true
    }
  }
  log {
    category = "PartitionKeyStatistics"
    enabled  = true

    retention_policy {
      enabled = true
    }
  }
  log {
    category = "PartitionKeyRUConsumption"
    enabled  = true

    retention_policy {
      enabled = true
    }
  }
  log {
    category = "ControlPlaneRequests"
    enabled  = true

    retention_policy {
      enabled = true
    }
  }
  log {
    category = "CassandraRequests"
    enabled  = true

    retention_policy {
      enabled = true
    }
  }
  log {
    category = "GremlinRequests"
    enabled  = true

    retention_policy {
      enabled = true
    }
  }

  metric {
    category = "Requests"

    retention_policy {
      enabled = true
    }
  }

}