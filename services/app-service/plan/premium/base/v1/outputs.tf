output "id" {
    value = azurerm_app_service_plan.app_service_plan.id
}
output "storage_connection_string" {
    value = module.func_storage.primary_connection_string
}
output "storage_account_name" {
    value = module.func_storage.name
}
output "storage_account_access_key" {
    value = module.func_storage.primary_access_key
}
output "storage_account" {
  value = {

    connection_string = module.func_storage.primary_connection_string
    name              = module.func_storage.name
    access_key        = module.func_storage.primary_access_key
    id                = module.func_storage.id
    object_id         = module.func_storage.principal_id

  }
}