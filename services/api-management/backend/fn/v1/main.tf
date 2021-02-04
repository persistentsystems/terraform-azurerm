

resource "azurerm_api_management_backend" "apim_backend" {
  
  resource_group_name = var.context.resource_group_name
  api_management_name = var.service_settings.endpoint

  name                = var.service_settings.name
  protocol            = var.service_settings.backend.protocol
  url                 = "https://${var.service_settings.fn.name}.azurewebsites.net/api"

  credentials {
    header = {
      "x-functions-key" = var.service_settings.fn.key,
    }
  }

}
