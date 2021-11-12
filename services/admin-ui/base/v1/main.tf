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

  # active_directory {
  #   client_id = "1d9f5677-f64b-4e2b-9de4-36c4165c4fcd"
  # }

}

# data "azurerm_app_service" "adminui" {
#   name                = "${var.context.application_name}-${var.context.environment_name}-adminui"
#   resource_group_name =  var.context.resource_group_name
# }