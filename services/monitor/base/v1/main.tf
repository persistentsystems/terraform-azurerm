/*
resource "azurerm_monitor_metric_alert" "alert" {
  name                = var.custom_rules_settings.name
  resource_group_name = var.context.resource_group_name
  scopes              = var.custom_rules_settings.scopes
  description         = var.custom_rules_settings.description

  criteria {
    metric_namespace = var.custom_rules_settings.metric_namespace
    metric_name      = var.custom_rules_settings.metric_name
    aggregation      = var.custom_rules_settings.aggregation
    operator         = var.custom_rules_settings.operator
    threshold        = var.custom_rules_settings.threshold

    dimension {
      name     = var.custom_rules_settings.dimensions_name
      operator = var.custom_rules_settings.dimensions_operator
      values   = var.custom_rules_settings.values
    }
  }

  action {
    action_group_id = var.custom_rules_settings.action_group_id
  }
  
}
*/

resource "azurerm_monitor_metric_alert" "alert" {
  name                = string
  resource_group_name = string
  scopes              = list(string)
  description         = string

  criteria {
    metric_namespace = string
    metric_name      = string
    aggregation      = string
    operator         = string
    threshold        = string

    dimension {
      name     = string
      operator = string
      values   = list(string)
    }
  }

  action {
    action_group_id = string
  }
  
}