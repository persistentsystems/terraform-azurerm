resource "azurerm_monitor_metric_alert" "alert" {
  
  resource_group_name = var.context.resource_group_name
  name                = var.name
  scopes              = var.scopes
  description         = var.description
  

  dynamic "criteria" {
    for_each = var.criteria_settings
    content {

      metric_namespace    = var.criteria_settings.metric_namespace
      metric_name         = var.criteria_settings.metric_name
      aggregation         = var.criteria_settings.aggregation
      operator            = var.criteria_settings.operator
      threshold           = var.criteria_settings.threshold

      dimension {

        name     = var.criteria_settings.dimensions_name
        operator = var.criteria_settings.dimensions_operator
        values              = var.criteria_settings.values
      }
    }

  }

  action {
    action_group_id = var.custom_rules_settings.action_group_id
  }
  
}