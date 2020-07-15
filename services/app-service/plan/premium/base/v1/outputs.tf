output "id" {
    value = azurerm_app_service_plan.app_service_plan.id
}
output "storage_connection_string" {
    value = module.func_storage.primary_connection_string
}