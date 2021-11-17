output "name" {
    value = azurerm_app_service.admin_ui_app_service.name
}
output "identity" {
    value = azurerm_app_service.admin_ui_app_service.identity
}
output "id" {
  value = azurerm_app_service.admin_ui_app_service.id
}
output "site_name" {
    value = azurerm_app_service.admin_ui_app_service.default_site_hostname
}