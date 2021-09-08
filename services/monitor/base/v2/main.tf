resource "azurerm_monitor_metric_alert" "alert" {
  
  resource_group_name = var.context.resource_group_name
  name                = var.alert_settings.name
  scopes              = var.alert_settings.scopes
  description         = var.alert_settings.description
  window_size         = var.alert_settings.window_size
  
  criteria {
    metric_namespace    = var.criteria_settings.metric_namespace
    metric_name         = var.criteria_settings.metric_name
    aggregation         = var.criteria_settings.aggregation
    operator            = var.criteria_settings.operator
    threshold           = var.criteria_settings.threshold
    
  }
  action {
    action_group_id = var.custom_rules_settings.action_group_id
  }
  
}