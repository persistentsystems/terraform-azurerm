resource "azurerm_api_management_user" "user" {

  user_id             = var.service_settings.user_id
  api_management_name = var.service_settings.endpoint_name
  resource_group_name = var.context.resource_group_name
  first_name          = var.service_settings.first_name
  last_name           = var.service_settings.last_name
  email               = var.service_settings.email
  state               = "active"

}