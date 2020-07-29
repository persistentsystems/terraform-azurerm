

locals {
    required_settings = {
      "FUNCTIONS_WORKER_RUNTIME"          = var.service_settings.runtime_type,
      "APPINSIGHTS_INSTRUMENTATIONKEY"    = var.observability_settings.instrumentation_key,
    }
    combined_settings = merge(local.required_settings, var.service_settings.app_settings, var.security)
}


# This will deploy an Azure Function to the target Resource Group / App Service Plan
resource "azurerm_function_app" "function_app" {
  name                      = var.service_settings.name
  location                  = var.context.location
  resource_group_name       = var.context.resource_group_name
  app_service_plan_id       = var.service_settings.plan_id
  storage_connection_string = var.service_settings.storage_account.connection_string
  version                   = var.service_settings.runtime_version

  app_settings = local.combined_settings

  site_config {

    pre_warmed_instance_count = 1
    
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    app = var.context.application_name
    env = var.context.environment_name
  }

}


resource "time_sleep" "wait_30_seconds" {
  depends_on = [azurerm_function_app.function_app]

  create_duration = "30s"
}

# This resource will create (at least) 30 seconds after null_resource.previous
resource "null_resource" "next" {
  depends_on = [time_sleep.wait_30_seconds]
}
