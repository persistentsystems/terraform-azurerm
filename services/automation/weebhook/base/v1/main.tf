resource "azurerm_automation_webhook" "webhook" {
  name                    = var.service_settings.name
  resource_group_name     = var.context.resource_group_name
  automation_account_name = var.service_settings.automation_account_name
  expiry_time             = var.service_settings.expiry_time
  enabled                 = var.service_settings.enabled
  runbook_name            = var.service_settings.runbook_name
  parameters = {
    AppName = var.ps_variables.AppName
    EnvName = var.ps_variables.EnvName
    to_email = var.ps_variables.to_email
    from_email = var.ps_variables.from_email
  }
}