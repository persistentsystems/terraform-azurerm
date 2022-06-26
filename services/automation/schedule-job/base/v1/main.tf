resource "azurerm_automation_job_schedule" "job_schedule" {
  resource_group_name     = var.context.resource_group_name
  automation_account_name = var.service_settings.automation_account_name
  schedule_name           = var.service_settings.schedule_name
  runbook_name            = var.service_settings.runbook_name
  
}