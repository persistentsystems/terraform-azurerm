
resource "azurerm_api_management_subscription" "subscription" {
    
  api_management_name   = var.apim_name
  resource_group_name   = var.resource_group_name
  user_id               = var.service_settings.user_id
  product_id            = var.service_settings.product_id
  display_name          = var.service_settings.description
  state                 = "active"

}