
resource "azurerm_monitor_diagnostic_setting" "keyvault_diagnostic_setting" {

  name                        = "${var.service_settings.name}-eventgrid-logs"
  target_resource_id          = azurerm_eventgrid_topic.topic.id
  log_analytics_workspace_id  = var.observability_settings.workspace_id

  log {
    category = "DeliveryFailures"
    enabled  = true

    retention_policy {
      enabled = true
      days = var.observability_settings.retention_days
    }
  }
  log {
    category = "PublishFailures"
    enabled  = true

    retention_policy {
      enabled = true
      days = var.observability_settings.retention_days
    }
  }

  metric {
    category = "AllMetrics"

    retention_policy {
      enabled = true
      days = var.observability_settings.retention_days
    }
  }
}

resource "azurerm_monitor_diagnostic_setting" "eventgrid_log_setting" {

  name                        = "${var.service_settings.name}-eventgrid-storage"
  target_resource_id          = azurerm_eventgrid_topic.topic.id
  storage_account_id          = var.observability_settings.storage_account

  log {
    category = "DeliveryFailures"
    enabled  = true

    retention_policy {
      enabled = true
      days = 0
    }
  }
  log {
    category = "PublishFailures"
    enabled  = true

    retention_policy {
      enabled = true
      days = 0
    }
  }
}
