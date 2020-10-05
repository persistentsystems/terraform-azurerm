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

  resource_group_name = var.context.resource_group_name
  dynamic "alerts" {
  for_each = var.metrics

    name                = alerts.value.name
    scopes              = alerts.value.scopes
    description         = alerts.value.description


    criteria {
      metric_namespace = alerts.value.metric_namespace
      metric_name      = alerts.value.metric_name
      aggregation      = alerts.value.aggregation
      operator         = alerts.value.operator
      threshold        = alerts.value.threshold

      dimension {
        name     = alerts.value.dimensions_name
        operator = alerts.value.dimensions_operator
        values   = alerts.value.values
      }
    }
  }
  action {
    action_group_id = azurerm_monitor_action_group.monitor.id
  }
} 