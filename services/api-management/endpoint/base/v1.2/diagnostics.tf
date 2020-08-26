
resource "azurerm_monitor_diagnostic_setting" "diagnostic_setting" {

  name                        = "${var.service_settings.name}-apim-logs"
  target_resource_id          = azurerm_api_management.apim.id
  log_analytics_workspace_id  = var.observability_settings.workspace_id

  log {
    category = "GatewayLogs"
    enabled  = true

    retention_policy {
      enabled = true
      days = var.observability_settings.retention_days
    }
  }

  metric {
    category = "Gateway Requests"

    retention_policy {
      enabled = true
      days = var.observability_settings.retention_days
    }
  }

  metric {
    category = "Capacity"

    retention_policy {
      enabled = true
      days = var.observability_settings.retention_days
    }
  }

  metric {
    category = "EventHub Events"

    retention_policy {
      enabled = true
      days = var.observability_settings.retention_days
    }
  }

  metric {
    category = "Network Status"

    retention_policy {
      enabled = true
      days = var.observability_settings.retention_days
    }
  }

}

resource "azurerm_monitor_diagnostic_setting" "diagnostic_log_setting" {

  name                        = "${var.service_settings.name}-apim-storage"
  target_resource_id          = azurerm_api_management.apim.id
  storage_account_id          = var.observability_settings.storage_account  

  log {
    category = "GatewayLogs"
    enabled  = true

    retention_policy {
      enabled = true
      days = 0
    }
  }

}
