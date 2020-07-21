output "function_key" {
    value = "${lookup(azurerm_template_deployment.azfn_function_key.outputs, "functionkey")}"
}
output "hostname" {
    value = azurerm_function_app.function_app.default_hostname
}
output "name" {
    value = azurerm_function_app.function_app.name
}
output "identity" {
    value = azurerm_function_app.function_app.identity[0].identity_ids[0]
}