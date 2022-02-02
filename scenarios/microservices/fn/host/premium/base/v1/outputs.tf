
output "host_settings" {
  value = {

    plan_id                         = module.api_hosting_plan.id
    storage_account                 = module.api_hosting_plan.storage_account
    #instrumentation_key             = module.appinsights.instrumentation_key
    workspace_id                    = var.service_settings.workspace_id
    deployment_storage_account_name = module.code_storage.name
    deployment_storage_container    = azurerm_storage_container.code_storage.name
    deployment_package_sas          = data.azurerm_storage_account_sas.code_storage.sas
    id                              = module.code_storage.id
    func_id                         = module.api_hosting_plan.storage_account.id
    #func_storage_principal_id       = module.api_hosting_plan.storage_account.principal_id
  }
}