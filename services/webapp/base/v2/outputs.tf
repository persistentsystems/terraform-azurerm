output "name" {
    value = azurerm_app_service.webapp_docker.name
}
output "identity" {
    value = azurerm_app_service.webapp_docker.identity
}
output "id" {
  value = azurerm_app_service.webapp_docker.id
}
output "site_name" {
    value = azurerm_app_service.webapp_docker.default_site_hostname
}