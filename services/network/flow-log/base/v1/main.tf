resource "azurerm_network_watcher_flow_log" "flow_log" {
  network_watcher_name      = var.service_settings.network_watcher_name
  resource_group_name       = var.service_settings.network_watcher_resource_group_name
  name                      = var.service_settings.name
  network_security_group_id = var.service_settings.network_security_group_id
  storage_account_id        = var.service_settings.storage_account_id
  enabled                   = var.service_settings.enabled
  version                   = var.service_settings.version

  retention_policy {
    enabled = true
    days    = 0
  } 
  
  traffic_analytics {
    enabled               = var.traffic_analytics.enabled
    workspace_id          = var.traffic_analytics.workspace_id
    workspace_region      = var.traffic_analytics.workspace_region
    workspace_resource_id = var.traffic_analytics.workspace_resource_id
    interval_in_minutes   = var.traffic_analytics.interval_in_minutes
  }
}