
resource "azurerm_monitor_diagnostic_setting" "keyvault_diagnostic_setting" {

  name                        = "${var.service_settings.name}-eventgrid-logs"
  target_resource_id          = azurerm_eventgrid_topic.topic.id
  log_analytics_workspace_id  = var.observability_settings.workspace_id

  log {
    category = "DeliveryFailures"
    enabled  = true

    retention_policy {
      enabled = true
    }
  }
  log {
    category = "PublishFailures"
    enabled  = true

    retention_policy {
      enabled = true
    }
  }

  metric {
    category = "AllMetrics"

    retention_policy {
      enabled = true
    }
  }
}
