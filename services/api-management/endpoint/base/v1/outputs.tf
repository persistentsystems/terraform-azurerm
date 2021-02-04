output "id" {
  value = azurerm_api_management.apim.id
}
output "name" {
  value = azurerm_api_management.apim.name
}
output "public_ip_addresses" {
  value = azurerm_api_management.apim.public_ip_addresses
}
output "public_ip_cidr_ranges" {
  value = formatlist("%s/32", azurerm_api_management.apim.public_ip_addresses )
}
output "gateway_url" {
  value = azurerm_api_management.apim.gateway_url
}

locals {
  gateway_domain_no_protocol = replace(azurerm_api_management.apim.gateway_url, "https://", "")
  gateway_domain = replace(local.gateway_domain_no_protocol, "\\", "")
}

output "gateway_domain" {
  value = local.gateway_domain
}

output "logger" {
  value = {
    id   = azurerm_api_management_logger.app_insights.id
    name = azurerm_api_management_logger.app_insights.name
  }
}