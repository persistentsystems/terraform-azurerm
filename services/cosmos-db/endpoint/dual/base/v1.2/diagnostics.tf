resource "azurerm_monitor_diagnostic_setting" "frontdoor_diagnostic_setting" {

  name                        = "${var.service_settings.name}-cosmosdb-logs"
  target_resource_id          = azurerm_cosmosdb_account.account.id
  log_analytics_workspace_id  = var.service_settings.workspace_id

  log {
    category = "DataPlaneRequests"
    enabled  = true

    retention_policy {
      enabled = true
      days = var.observability_settings.retention_days
    }
  }
  log {
    category = "MongoRequests"
    enabled  = true

    retention_policy {
      enabled = true
      days = var.observability_settings.retention_days
    }
  }
  log {
    category = "QueryRuntimeStatistics"
    enabled  = true

    retention_policy {
      enabled = true
      days = var.observability_settings.retention_days
    }
  }
  log {
    category = "PartitionKeyStatistics"
    enabled  = true

    retention_policy {
      enabled = true
      days = var.observability_settings.retention_days
    }
  }
  log {
    category = "PartitionKeyRUConsumption"
    enabled  = true

    retention_policy {
      enabled = true
      days = var.observability_settings.retention_days
    }
  }
  log {
    category = "ControlPlaneRequests"
    enabled  = true

    retention_policy {
      enabled = true
      days = var.observability_settings.retention_days
    }
  }
  log {
    category = "CassandraRequests"
    enabled  = true

    retention_policy {
      enabled = true
      days = var.observability_settings.retention_days
    }
  }
  log {
    category = "GremlinRequests"
    enabled  = true

    retention_policy {
      enabled = true
      days = var.observability_settings.retention_days
    }
  }

  metric {
    category = "Requests"

    retention_policy {
      enabled = true
    }
  }

}

resource "azurerm_monitor_diagnostic_setting" "cosmosdb_log_setting" {

  name                        = "${var.service_settings.name}-cosmosdb-storage"
  target_resource_id          = azurerm_cosmosdb_account.account.id
  storage_account_id          = var.observability_settings.storage_account_id

  log {
    category = "DataPlaneRequests"
    enabled  = true

    retention_policy {
      enabled = true
      days = 0
    }
  }
  log {
    category = "MongoRequests"
    enabled  = true

    retention_policy {
      enabled = true
      days = 0
    }
  }
  log {
    category = "QueryRuntimeStatistics"
    enabled  = true

    retention_policy {
      enabled = true
      days = 0
    }
  }
  log {
    category = "PartitionKeyStatistics"
    enabled  = true

    retention_policy {
      enabled = true
      days = 0
    }
  }
  log {
    category = "PartitionKeyRUConsumption"
    enabled  = true

    retention_policy {
      enabled = true
      days = 0
    }
  }
  log {
    category = "ControlPlaneRequests"
    enabled  = true

    retention_policy {
      enabled = true
      days = 0
    }
  }
  log {
    category = "CassandraRequests"
    enabled  = true

    retention_policy {
      enabled = true
      days = 0
    }
  }
  log {
    category = "GremlinRequests"
    enabled  = true

    retention_policy {
      enabled = true
      days = 0
    }
  }

}