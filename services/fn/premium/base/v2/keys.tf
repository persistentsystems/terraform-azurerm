data azurerm_function_app_host_keys azfn_function_keyv2 {
  depends_on = [azurerm_function_app.function_appv2]
  name       = azurerm_function_app.function_appv2.name
  resource_group_name    = var.context.resource_group_name 
}
