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


/*
resource "azurerm_monitor_metric_alert" "alert" {
  name                = var.metrics.name
  resource_group_name = var.context.resource_group_name
  scopes              = var.metrics.scopes
  description         = var.metrics.description

  criteria {
    metric_namespace = var.parameters.metric_namespace
    metric_name      = var.parameters.metric_name
    aggregation      = var.parameters.aggregation
    operator         = var.parameters.operator
    threshold        = var.parameters.threshold

    dimension {
      name     = var.dimensions.name
      operator = var.dimensions.operator
      values   = var.dimensions.values
    }
  }

  action {
    action_group_id = azurerm_monitor_action_group.monitor.id
  }
} 
*/

resource "azurerm_monitor_metric_alert" "alert" {

  
  dynamic "metric_alert" {
    for_each = var.custom_rules_settings
    content {
      name                = metric_alert.value.name
      scopes              = metric_alert.value.scopes
      description         = metric_alert.value.description
      resource_group_name = var.context.resource_group_name

      criteria {
        metric_namespace = metric_alert.value.metric_namespace
        metric_name      = metric_alert.value.metric_name
        aggregation      = metric_alert.value.aggregation
        operator         = metric_alert.value.operator
        threshold        = metric_alert.value.threshold

        dimension {
          name     = metric_alert.value.dimensions_name
          operator = metric_alert.value.dimensions_operator
          values   = metric_alert.value.values
        }
      }
    }
  }
  action {
    action_group_id = azurerm_monitor_action_group.monitor.id
  }
}