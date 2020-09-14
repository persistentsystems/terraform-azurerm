resource "azurerm_monitor_diagnostic_setting" "function_diagnostic_setting" {

  name                        = "${var.service_settings.name}-function-logs"
  target_resource_id          = azurerm_function_app.function_app.id
  log_analytics_workspace_id  = var.observability_settings.workspace_id

  log {
    category = "FunctionAppLogs"
    enabled  = true

    retention_policy {
      enabled = true
      days = var.observability_settings.retention_in_days
    }
  }
  
  metric {
    category = "AllMetrics"

    retention_policy {
      enabled = true
      days = var.observability_settings.retention_in_days
    }
  }
}

resource "azurerm_monitor_diagnostic_setting" "function_log_setting" {

  name                        = "${var.service_settings.name}-function-storage"
  target_resource_id          = azurerm_function_app.function_app.id
  storage_account_id          = var.observability_settings.storage_account_id

  log {
    category = "FunctionAppLogs"
    enabled  = true

    retention_policy {
      enabled = true
      days = 0
    }
  }
}