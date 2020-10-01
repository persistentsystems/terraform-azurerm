resource "azurerm_monitor_action_group" "monitor" {
  name                = var.service_settings.name
  resource_group_name = var.context.resource_group_name
  short_name          = var.service_settings.short_name

/*
  webhook_receiver {
    name        = var.service_settings.webhook_name
    service_uri = var.service_settings.service_uri
  }
  */
}

resource "azurerm_monitor_metric_alert" "alert" {
  name                = var.metrics.metric_alert_name
  resource_group_name = var.context.resource_group_name
  scopes              = [ var.metrics.scopes ]
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