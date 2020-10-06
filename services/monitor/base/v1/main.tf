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
  name                = var.dimensions.name
  scopes              = var.dimensions.scopes
  description         = var.dimensions.description


  dynamic "criteria" {
    for_each = var.custom_rules_settings
    
    content {
    #  name                = metric_alert.value.name
    #  scopes              = metric_alert.value.scopes

      metric_namespace = criteria.value.metric_namespace
      metric_name      = criteria.value.metric_name
      aggregation      = criteria.value.aggregation
      operator         = criteria.value.operator
      threshold        = criteria.value.threshold

      dimension {
        name     = criteria.value.dimensions_name
        operator = criteria.value.dimensions_operator
        values   = criteria.value.values
      }
    }
  }
  action {
    action_group_id = azurerm_monitor_action_group.monitor.id
  }
}