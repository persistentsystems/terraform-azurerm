resource "azurerm_api_management_group_user" "groupuser" {
  user_id             = var.service_settings.user_id
  group_name          = var.service_settings.group_name
  api_management_name = var.service_settings.endpoint_name
  resource_group_name = var.context.resource_group_name
  
}