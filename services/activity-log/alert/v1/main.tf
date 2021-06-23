resource "azurerm_monitor_activity_log_alert" "activity_log_alert" {

  name                = var.service_settings.name
  resource_group_name = var.context.resource_group_name
  scopes              = [var.service_settings.scope]
  description         = var.service_settings.description
  
  criteria {
    operation_name = var.service_settings.operation_name
    category       = var.service_settings.category
  }

  action {
    action_group_id = var.service_settings.action_group_id
  }

}
