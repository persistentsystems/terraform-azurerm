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
  
  site_config {
    dotnet_framework_version = var.service_settings.dotnet_version
        
  }
  app_settings              = var.service_settings.app_settings

  identity {
    type = "SystemAssigned"
  }
  tags = local.final_tags
}
data "azurerm_subnet" "web_integration" {
  name                 = "${var.context.application_name}-${var.context.environment_name}-fn-subnet"
  virtual_network_name = "${var.context.application_name}-${var.context.environment_name}-vnet"
  resource_group_name  = "${var.context.application_name}-${var.context.environment_name}-backend-${var.context.location_suffix}"
}
##This block will turn on the Vnet Integration for function apps
resource "azurerm_app_service_virtual_network_swift_connection" "web_app_vnet" {
  app_service_id = azurerm_app_service.admin_ui_app_service.id
  subnet_id      = data.azurerm_subnet.web_integration.id
}