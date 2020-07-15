resource "azurerm_api_management_user" "user" {

  user_id             = var.user_id
  api_management_name = var.apim_name
  resource_group_name = var.resource_group_name
  first_name          = var.first_name
  last_name           = var.last_name
  email               = var.email
  state               = "active"

}