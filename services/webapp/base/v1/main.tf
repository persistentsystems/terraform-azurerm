locals {   

    default_tags = {
      app = var.context.application_name
      env = var.context.environment_name
    }

    final_tags = merge (local.default_tags, var.tags )
}
resource "azurerm_app_service" "admin_ui_app_service" {
  name                      = var.service_settings.name
  location                  = var.context.location
  resource_group_name       = var.context.resource_group_name
  app_service_plan_id       = var.service_settings.plan_id
  https_only                = true
  
  site_config {
    dotnet_framework_version = var.service_settings.dotnet_version
    ftps_state               = "Disabled"
  }
  app_settings              = var.service_settings.app_settings

  identity {
    type = "SystemAssigned"
  }
  tags = local.final_tags
}