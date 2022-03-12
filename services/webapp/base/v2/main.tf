locals {   

    default_tags = {
      app = var.context.application_name
      env = var.context.environment_name
    }

    final_tags = merge (local.default_tags, var.tags )
}
resource "azurerm_app_service" "webapp_docker" {
  name                      = var.service_settings.name
  location                  = var.context.location
  resource_group_name       = var.context.resource_group_name
  app_service_plan_id       = var.service_settings.plan_id
  https_only                = true
  
  site_config {
    linux_fx_version        = var.service_settings.linux_fx_version
    always_on               = "true"
    app_command_line        = var.service_settings.app_command_line
    ip_restriction {
      virtual_network_subnet_id = var.service_settings.virtual_network_subnet_id
      name                      = var.service_settings.restriction_name
      priority                  = var.service_settings.priority
      action                    = var.service_settings.action
    }
    #health_check_path       = "/api/health"
  }
  app_settings              = var.service_settings.app_settings

  identity {
    type = "SystemAssigned"
  }
  tags = local.final_tags
}