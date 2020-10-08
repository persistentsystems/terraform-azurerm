resource "azurerm_monitor_action_group" "monitor" {
  name                = var.service_settings.name
  resource_group_name = var.context.resource_group_name
  short_name          = var.service_settings.short_name

### For sending an email on alert
## Dynamic block logic
  dynamic "email_receiver" {
    for_each = var.email_settings
	
	  content {
      name          = email_receiver.value.email_title
      email_address = email_receiver.value.email_address
    }
  }
}