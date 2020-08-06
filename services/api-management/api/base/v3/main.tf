data "azurerm_client_config" "current" {}

resource "azurerm_api_management_api" "api" {

  resource_group_name = var.context.resource_group_name

  api_management_name = var.service_settings.endpoint_name

  revision            = var.service_settings.revision
  name                = var.service_settings.name
  display_name        = var.service_settings.description
  path                = var.service_settings.path
  protocols           = [var.service_settings.primary_protocol]

}
