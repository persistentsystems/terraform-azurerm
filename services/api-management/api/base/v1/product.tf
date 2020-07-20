
resource "azurerm_api_management_product_api" "product_link" {
    
  resource_group_name = var.resource_group_name

  api_name            = azurerm_api_management_api.api.name
  product_id          = var.product_id
  api_management_name = var.service_settings.endpoint_name

}