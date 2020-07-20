resource "azurerm_api_management_backend" "apim_backend" {
  
  resource_group_name = var.context.resource_group_name
  
  name                = var.service_settings.name
  api_management_name = var.service_settings.endpoint_name

  protocol            = var.backend_settings.protocol
  url                 = "https://${var.backend_settings.function_name}.azurewebsites.net/api"

  credentials {
    header = {
      "x-functions-key" = var.backend_settings.function_key,
    }
  }

}