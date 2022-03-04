output "name" {
    value = azurerm_app_service.patientmatch_docker.name
}
output "identity" {
    value = azurerm_app_service.patientmatch_docker.identity
}
output "id" {
  value = azurerm_app_service.patientmatch_docker.id
}
output "site_name" {
    value = azurerm_app_service.patientmatch_docker.default_site_hostname
}