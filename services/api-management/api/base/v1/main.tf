data "azurerm_client_config" "current" {}

resource "azurerm_api_management_api" "api" {

  resource_group_name = var.context.resource_group_name

  api_management_name = var.service_setting.endpoint_name
  
  revision            = var.service_setting.revision
  name                = var.service_setting.name
  display_name        = var.service_setting.description
  path                = var.service_setting.path
  protocols           = [var.service_setting.primary_protocol]

}