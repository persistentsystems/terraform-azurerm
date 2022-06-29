resource "azurerm_automation_schedule" "automation_schedule" {
  name                    = var.service_settings.name
  resource_group_name     = var.context.resource_group_name
  automation_account_name = var.service_settings.automation_account_name
  frequency               = var.service_settings.frequency
  interval                = var.service_settings.interval
  start_time              = var.service_settings.start_time
  #timezone                = var.service_settings.timezone
  description             = var.service_settings.description
  month_days              = var.service_settings.month_days
}