data "azurerm_monitor_diagnostic_categories" "diagnostic_categories" {
  resource_id = azurerm_key_vault.keyvault.id
}

resource "azurerm_monitor_diagnostic_setting" "keyvault_diagnostic_setting" {
  name                        = "${var.service_settings.name}-keyvault-logs"
  target_resource_id          = azurerm_key_vault.keyvault.id
  log_analytics_workspace_id  = var.observability_settings.workspace_id

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

resource "azurerm_monitor_diagnostic_setting" "keyvault_log_setting" {
  name                        = "${var.service_settings.name}-keyvault-storage"
  target_resource_id          = azurerm_key_vault.keyvault.id
  storage_account_id          = var.observability_settings.storage_account

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