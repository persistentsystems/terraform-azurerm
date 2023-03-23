# data "azurerm_monitor_diagnostic_categories" "diagnostic_categories" {
#   resource_id = azurerm_storage_account.storage_account.id
# }

# resource "azurerm_monitor_diagnostic_setting" "storage_log_diagnostic_setting" {

#   name                        = "${var.context.application_name}-${var.context.environment_name}-${var.service_settings.name}-logs"
#   target_resource_id          = azurerm_storage_account.storage_account.id
#   log_analytics_workspace_id  = var.observability_settings.workspace_id

#   dynamic log {
#     for_each = data.azurerm_monitor_diagnostic_categories.diagnostic_categories.logs
#     content {
#       category = log.value
#       enabled  = true

#       retention_policy {
#         enabled = true
#         days = var.observability_settings.retention_days
#       }
#     }
#   }

#   dynamic metric {
#     for_each = data.azurerm_monitor_diagnostic_categories.diagnostic_categories.metrics 
#     content {
#       category = metric.value

#       retention_policy {
#         enabled = true
#         days = var.observability_settings.retention_days
#       }
#     }
#   }

# }

# resource "azurerm_monitor_diagnostic_setting" "storage_storage_diagnostic_setting" {

#   name                        = "${var.context.application_name}-${var.context.environment_name}-${var.service_settings.name}-storage-logs"
#   target_resource_id          = azurerm_storage_account.storage_account.id
#   storage_account_id          = var.observability_settings.storage_account

#   dynamic log {
#     for_each = data.azurerm_monitor_diagnostic_categories.diagnostic_categories.logs
#     content {
#       category = log.value
#       enabled  = true

#       retention_policy {
#         enabled = true
#         days = 0
#       }
#     }
#   }
#   metric {
#       category = "AllMetrics"
#       enabled  = true 

#       retention_policy {
#         enabled = true
#         days = 0
#       }
#   }

# }
