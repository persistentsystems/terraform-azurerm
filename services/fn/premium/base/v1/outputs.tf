output "id" {
  value = azurerm_function_app.function_app.id
}
output "name" {
  value = azurerm_function_app.function_app.name
}
output "hostname" {
  value = azurerm_function_app.function_app.default_hostname
}
output "identity" {
  value = azurerm_function_app.function_app.identity
}
output "key" {
  value = data.azurerm_function_app_host_keys.function_keys.default_function_key
}
