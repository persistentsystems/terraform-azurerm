resource "azurerm_monitor_scheduled_query_rules_alert" "example" {
  name                = var.custom_rules_settings.name
  location            = var.context.location
  resource_group_name = var.context.resource_group_name
  description         = var.custom_rules_settings.description
  enabled             = true
  
  action {
    action_group      = var.custom_rules_settings.action_group
  }
  data_source_id      = var.custom_rules_settings.data_source_id
  
  query               = var.custom_rules_settings.query
  severity            = var.custom_rules_settings.severity
  frequency           = var.custom_rules_settings.frequency
  time_window         = var.custom_rules_settings.time_window
  
  trigger {
    operator          = var.custom_rules_settings.operator
    threshold         = var.custom_rules_settings.threshold
  }

}