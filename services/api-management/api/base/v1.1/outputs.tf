output "api_name" {
    value = azurerm_api_management_api.api.name
}

output "description" {
    value = azurerm_api_management_api.api.display_name
}