data "azurerm_function_app_host_keys" "function_keys" {

  name                = azurerm_function_app.function_app.name
  resource_group_name = var.context.resource_group_name

  depends_on = [
    azurerm_function_app.function_app
  ]
}
