output "id" {
    value = azurerm_app_service_plan.app_service_plan.id
}
output "name" {
    value = azurerm_app_service_plan.app_service_plan.name
}
output "storage_account" {
  value = {

    connection_string = module.func_storage.primary_connection_string
    name              = module.func_storage.name
    access_key        = module.func_storage.primary_access_key
    sas               = data.azurerm_storage_account_sas.code_storage.sas

  }
}