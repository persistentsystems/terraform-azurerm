data "azurerm_monitor_diagnostic_categories" "diagnostic_categories_postgres" {
  resource_id = azurerm_postgresql_flexible_server.postgres_server.id 
}

resource "azurerm_monitor_diagnostic_setting" "diagnostic_setting" {

  name                        = "${var.service_settings.name}-postgresdb-logs"
  target_resource_id          = azurerm_postgresql_flexible_server.postgres_server.id
  log_analytics_workspace_id  = var.observability_settings.workspace_id

  dynamic log {
    for_each = data.azurerm_monitor_diagnostic_categories.diagnostic_categories_postgres.logs
    content {
      category = log.value
      enabled  = true

      retention_policy {
        enabled = true
        days = var.observability_settings.retention_days
      }
    }
  }

  dynamic metric {
    for_each = data.azurerm_monitor_diagnostic_categories.diagnostic_categories_postgres.metrics 
    content {
      category = metric.value

      retention_policy {
        enabled = true
        days = var.observability_settings.retention_days
      }
    }
  }


}

resource "azurerm_monitor_diagnostic_setting" "log_setting_postgres" {

  name                        = "${var.service_settings.name}-postgresdb-storage"
  target_resource_id          = azurerm_postgresql_flexible_server.postgres_server.id
  storage_account_id          = var.observability_settings.storage_account

  dynamic log {
    for_each = data.azurerm_monitor_diagnostic_categories.diagnostic_categories_postgres.logs
    content {
      category = log.value
      enabled  = true

      retention_policy {
        enabled = true
        days = 0
      }
    }
  }
  metric {
      category = "AllMetrics"
      enabled  = false 

      retention_policy {
        enabled = false
        days = 0
      }
  }


}