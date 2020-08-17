
resource "azurerm_monitor_diagnostic_setting" "diagnostic_setting" {

  name                        = "${var.service_settings.name}-apim-logs"
  target_resource_id          = azurerm_api_management.apim.id
  log_analytics_workspace_id  = var.observability_settings.workspace_id

  log {
    category = "GatewayLogs"
    enabled  = true

    retention_policy {
      enabled = true
    }
  }

  metric {
    category = "Gateway Requests"

    retention_policy {
      enabled = true
    }
  }

  metric {
    category = "Capacity"

    retention_policy {
      enabled = true
    }
  }

  metric {
    category = "EventHub Events"

    retention_policy {
      enabled = true
    }
  }

  metric {
    category = "Network Status"

    retention_policy {
      enabled = true
    }
  }

}
