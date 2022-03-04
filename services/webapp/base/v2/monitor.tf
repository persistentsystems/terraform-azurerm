data "azurerm_monitor_diagnostic_categories" "diagnostic_categories" {
  resource_id = azurerm_app_service.patientmatch_docker.id
}

resource "azurerm_monitor_diagnostic_setting" "web_diagnostic_setting" {

  name                        = "${var.service_settings.name}-web-logs"
  target_resource_id          = azurerm_app_service.patientmatch_docker.id
  log_analytics_workspace_id  = var.observability_settings.workspace_id

  dynamic log {
    for_each = data.azurerm_monitor_diagnostic_categories.diagnostic_categories.logs
    content {
      category = log.value
      enabled  = true

      retention_policy {
        enabled = true
        days = var.observability_settings.retention_in_days
      }
    }
  }

  dynamic metric {
    for_each = data.azurerm_monitor_diagnostic_categories.diagnostic_categories.metrics 
    content {
      category = metric.value

      retention_policy {
        enabled = true
        days = var.observability_settings.retention_in_days
      }
    }
  }



}

resource "azurerm_monitor_diagnostic_setting" "web_log_setting" {

  name                        = "${var.service_settings.name}-web-storage"
  target_resource_id          = azurerm_app_service.patientmatch_docker.id
  storage_account_id          = var.observability_settings.storage_account_id

  dynamic log {
    for_each = data.azurerm_monitor_diagnostic_categories.diagnostic_categories.logs
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