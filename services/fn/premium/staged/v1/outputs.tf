#output "function_key" {
#    value = "${lookup(azurerm_template_deployment.azfn_function_key.outputs, "functionkey")}"
#}
output function_key {
    value = data.azurerm_function_app_host_keys.azfn_function_key.default_function_key
}
output "hostname" {
    value = azurerm_function_app.function_app.default_hostname
}
output "name" {
    value = azurerm_function_app.function_app.name
}
output "identity" {
    value = azurerm_function_app.function_app.identity
}
output "id" {
  value = azurerm_function_app.function_app.id
}