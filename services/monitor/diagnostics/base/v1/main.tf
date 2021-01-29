resource "azurerm_monitor_diagnostic_setting" "short_term_logs" {

  name                           = "${var.service_settings.name}-short-term"
  target_resource_id             = var.service_settings.resource_id
  log_analytics_workspace_id     = var.observability_settings.workspace_id
  log_analytics_destination_type = "Dedicated"

  dynamic "log" {
    for_each = var.service_settings.logs
      content {
        
        category = log.value
        retention_policy {
          enabled = true
          days = var.observability_settings.retention_policy.short_term
        }

      }
  }

  dynamic "metric" {
    for_each = var.service_settings.metrics
      content {
        
        category = metric.value
        retention_policy {
          enabled = true
          days = var.observability_settings.retention_policy.short_term
        }

      }
  }

}

resource "azurerm_monitor_diagnostic_setting" "long_term_logs" {

  name                        = "${var.service_settings.name}-long-term"
  target_resource_id          = var.service_settings.resource_id
  storage_account_id          = var.observability_settings.storage_account  

  dynamic "log" {
    for_each = var.service_settings.logs
      content {
        
        category = log.value
        retention_policy {
          enabled = true
          days = var.observability_settings.retention_policy.long_term
        }

      }
  }

  dynamic "metric" {
    for_each = var.service_settings.metrics
      content {
        
        category = metric.value
        retention_policy {
          enabled = true
          days = var.observability_settings.retention_policy.long_term
        }

      }
  }
}