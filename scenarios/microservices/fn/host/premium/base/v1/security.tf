data "azurerm_client_config" "current" {}

module "keyvault" {
  
  source                    = "../../../../../../../services/keyvault/endpoint/base/v1.1"

  context                   = var.context
  
  service_settings = {
    name                    = "${var.context.application_name}-${var.context.environment_name}-${var.context.location_suffix}"
    workspace_id            = var.service_settings.workspace_id
    soft_delete_enabled     = var.service_settings.soft_delete_enabled
    log_storage_account     = module.logs_hot_storage.name
  }
  
  observability_settings = {
    instrumentation_key         = module.host.host_settings.instrumentation_key
    workspace_id                = var.service_settings.workspace_id
    storage_account             = module.logs_hot_storage.name
    retention_days              = 365
  }

}


module "terraform_admin" {
  
  source                    = "../../../../../../../services/keyvault/accesspolicy/templates/machine-admin/v1"

  keyvault_id               = module.keyvault.id
  application_id            = data.azurerm_client_config.current.client_id

}
