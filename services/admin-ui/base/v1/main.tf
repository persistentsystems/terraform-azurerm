locals {   

      required_settings = {
      #"FUNCTIONS_WORKER_RUNTIME"          = var.service_settings.runtime_type,
      "APPINSIGHTS_INSTRUMENTATIONKEY"    = var.observability_settings.instrumentation_key,
    }
    combined_settings = merge(local.required_settings, var.service_settings.app_settings)

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
  app_settings              = local.combined_settings

  site_config {
    dotnet_framework_version = var.service_settings.dotnet_version
        
  }

  identity {
    type = "SystemAssigned"
  }
  tags = local.final_tags

}

# data "azurerm_app_service" "adminui" {
#   name                = "${var.context.application_name}-${var.context.environment_name}-adminui"
#   resource_group_name =  var.context.resource_group_name
# }