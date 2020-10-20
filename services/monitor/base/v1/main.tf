resource "azurerm_monitor_metric_alert" "alert" {
  
  resource_group_name = var.context.resource_group_name
  name                = var.alert_settings.name
  scopes              = var.alert_settings.scopes
  description         = var.alert_settings.description
  

  dynamic "criteria" {
    for_each = var.criteria_settings
    content {

      metric_namespace    = criteria.value.metric_namespace
      metric_name         = criteria.value.metric_name
      aggregation         = criteria.value.aggregation
      operator            = criteria.value.operator
      threshold           = criteria.value.threshold

      dimension {

        name     = criteria.value.name
        operator = criteria.value.operator
        values   = criteria.value.values
      }
    }

  }

  action {
    action_group_id = var.custom_rules_settings.action_group_id
  }
  
}