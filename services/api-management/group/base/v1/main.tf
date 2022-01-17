resource "azurerm_api_management_group" "group" {
  name                = var.service_settings.name
  api_management_name = var.service_settings.endpoint_name
  resource_group_name = var.context.resource_group_name
  display_name        = var.service_settings.display_name
  description         = var.service_settings.description
}