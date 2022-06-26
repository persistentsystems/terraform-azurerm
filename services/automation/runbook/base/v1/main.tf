locals {
    default_tags = {
      app = var.context.application_name
      env = var.context.environment_name
    }

    final_tags = merge (local.default_tags, var.tags ) 
}
resource "azurerm_automation_runbook" "runbook" {
  name                    = var.service_settings.name
  location                = var.context.location
  resource_group_name     = var.context.resource_group_name
  automation_account_name = var.service_settings.automation_account_name
  log_verbose             = var.service_settings.log_verbose
  log_progress            = var.service_settings.log_progress
  description             = var.service_settings.description
  runbook_type            = var.service_settings.runbook_type

  content = var.service_settings.content
  tags = local.final_tags
}