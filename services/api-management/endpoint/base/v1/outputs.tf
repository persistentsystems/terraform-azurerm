output "id" {
  value = azurerm_api_management.apim.id
}
output "name" {
  value = azurerm_api_management.apim.name
}
output "public_ip_addresses" {
  value = azurerm_api_management.apim.public_ip_addresses
}
output "gateway_url" {
  value = azurerm_api_management.apim.gateway_url
}

output "api_logger" {
  value = azurerm_api_management_logger.app_insights.name
}

output "api_logger_id" {
  value = azurerm_api_management_logger.app_insights.id
}