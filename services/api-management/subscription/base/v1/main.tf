
resource "azurerm_api_management_subscription" "subscription" {
    
  api_management_name   = var.apim_name
  resource_group_name   = var.resource_group_name
  user_id               = var.user_id
  product_id            = var.product_id
  display_name          = var.description
  state                 = "active"

}