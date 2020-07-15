
output "host_settings" {
  value = {

    plan_id                   = module.api_hosting_plan.id
    storage_connection_string = module.api_hosting_plan.storage_connection_string
    instrumentation_key       = module.appinsights.instrumentation_key
    keyvault_id               = module.keyvault.id
    workspace_id              = var.service_settings.workspace_id
    deployment_storage_account_name = module.code_storage.name
    deployment_storage_container    = azurerm_storage_container.code_storage.name
    deployment_package_sas          = data.azurerm_storage_account_sas.code_storage.sas

  }
}