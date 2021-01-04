resource "azurerm_monitor_diagnostic_setting" "frontdoor_diagnostic_setting" {

  name                        = "${var.service_settings.name}-frontdoor-logs"
  target_resource_id          = azurerm_frontdoor.frontdoor.id
  log_analytics_workspace_id  = var.service_settings.workspace_id

  log {
    category = "FrontdoorAccessLog"
    enabled  = true

    retention_policy {
      enabled = true
      days = var.observability_settings.retention_days
    }
  }
  log {
    category = "FrontdoorWebApplicationFirewallLog"
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

resource "azurerm_monitor_diagnostic_setting" "frontdoor_log_setting" {

  name                        = "${var.service_settings.name}-frontdoor-storage"
  target_resource_id          = azurerm_frontdoor.frontdoor.id
  storage_account_id          = var.observability_settings.storage_account_id

  log {
    category = "FrontdoorAccessLog"
    enabled  = true

    retention_policy {
      enabled = true
      days = 0
    }
  }
  log {
    category = "FrontdoorWebApplicationFirewallLog"
    enabled  = true

    retention_policy {
      enabled = true
      days = 0
    }
  }
}