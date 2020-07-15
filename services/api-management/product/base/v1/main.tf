resource "azurerm_api_management_product" "product" {

  product_id            = var.product_id
  api_management_name   = var.apim_name
  resource_group_name   = var.resource_group_name
  display_name          = var.description
  subscription_required = true
  approval_required     = false
  published             = true

}