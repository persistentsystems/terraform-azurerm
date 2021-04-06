data "azurerm_monitor_diagnostic_categories" "diagnostic_categories" {
  resource_id = azurerm_api_management.apim.id
}

resource "azurerm_monitor_diagnostic_setting" "diagnostic_setting" {

  name                        = "${var.service_settings.name}-apim-logs"
  target_resource_id          = azurerm_api_management.apim.id
  log_analytics_workspace_id  = var.observability_settings.workspace_id
  log_analytics_destination_type = "Dedicated"

  dynamic log {
    for_each = data.azurerm_monitor_diagnostic_categories.diagnostic_categories.logs
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
    for_each = data.azurerm_monitor_diagnostic_categories.diagnostic_categories.metrics 
    content {
      category = metric.value

      retention_policy {
        enabled = true
        days = var.observability_settings.retention_days
      }
    }
  }

}


resource "azurerm_monitor_diagnostic_setting" "diagnostic_log_setting" {

  name                        = "${var.service_settings.name}-apim-storage"
  target_resource_id          = azurerm_api_management.apim.id
  storage_account_id          = var.observability_settings.storage_account  
  # A bug in the provider, or MS API, if I don't specify this then I get 
  # a contstant rebuild state.  We aren't sending this log to LA so 
  # this shouldn't matter.
  # log_analytics_destination_type = "AzureDiagnostics"

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
