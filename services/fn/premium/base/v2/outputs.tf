#output "function_key" {
#    value = "${lookup(azurerm_template_deployment.azfn_function_key.outputs, "functionkey")}"
#}
# output function_key {
#     value = data.azurerm_function_app_host_keys.azfn_function_keyv2.default_function_key
# }
output "function_name" {
    value = azurerm_function_app.function_appv2.name
}
output "hostname" {
    value = azurerm_function_app.function_appv2.default_hostname
}
output "name" {
    value = azurerm_function_app.function_appv2.name
}
output "identity" {
    value = azurerm_function_app.function_appv2.identity
}
output "id" {
  value = azurerm_function_app.function_appv2.id
}
output "function_app_id" {
  value = azurerm_function_app.function_appv2.id
}