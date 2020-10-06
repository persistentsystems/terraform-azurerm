resource "azurerm_monitor_action_group" "monitor" {
  name                = var.service_settings.name
  resource_group_name = var.context.resource_group_name
  short_name          = var.service_settings.short_name

/*
### For sending an email on alert
  email_receiver {
    name          = "sendtoadmin"
    email_address = "testing@test.com"
  }
*/
}

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
    action_group_id = azurerm_monitor_action_group.monitor.id
  }
}