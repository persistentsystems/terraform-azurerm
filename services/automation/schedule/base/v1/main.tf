resource "azurerm_automation_schedule" "automation_schedule" {
  name                    = var.service_settings.name
  resource_group_name     = var.context.resource_group_name
  automation_account_name = var.service_settings.automation_account_name
  frequency               = var.service_settings.frequency
  interval                = var.service_settings.interval
  start_time              = "2022-06-28T18:00:15+02:00"
  #timezone                = var.service_settings.timezone
  description             = var.service_settings.description
  week_days               = var.service_settings.week_days
}