resource "azurerm_monitor_action_group" "action_group" {

  resource_group_name = var.context.resource_group_name
  
  name                = var.service_settings.name
  short_name          = var.service_settings.short_name

/*
  dynamic "email_receiver" {
    for_each = var.service_settings.subscribers
      content {
        
        name                    = name
        email_address           = email
        use_common_alert_schema = true

      }
  }
*/

  email_receiver {
    name = var.service_settings.subscriber_name
    email_address = var.service_settings.subscriber_email
  }

}
