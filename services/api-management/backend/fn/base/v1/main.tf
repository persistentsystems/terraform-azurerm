resource "azurerm_api_management_backend" "apim_backend" {
  
  name                = var.service_settings.name
  resource_group_name = var.context.resource_group_name
  api_management_name = var.service_settings.endpoint_name
  protocol            = var.service_settings.protocol
  url                 = "https://${var.function_name}.azurewebsites.net/api"

  credentials {
    header = {
      "x-functions-key" = var.service_settings.function_key,
    }
  }

}