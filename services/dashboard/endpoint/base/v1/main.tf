locals {
    default_tags = {
      app = var.context.application_name
      env = var.context.environment_name
    }

    final_tags = merge (local.default_tags, var.tags ) 
}

resource "azurerm_dashboard" "dashboard" {
  name                = var.service_settings.name
  resource_group_name = var.context.resource_group_name
  location            = var.context.location
  tags                = local.final_tags
  dashboard_properties = var.service_settings.dashboard_properties
}