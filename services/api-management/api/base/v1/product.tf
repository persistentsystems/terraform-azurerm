
# Create a link to all the specified products
resource "azurerm_api_management_product_api" "product_link" {
  
  count               = length(var.service_settings.api.products)
  resource_group_name = var.context.resource_group_name

  api_name            = azurerm_api_management_api.api.name
  product_id          = element(var.service_settings.api.products, count.index)
  api_management_name = var.service_settings.endpoint

}