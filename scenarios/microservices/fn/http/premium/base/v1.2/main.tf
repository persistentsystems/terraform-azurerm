

locals {

  required_settings = {
      "WEBSITE_RUN_FROM_PACKAGE"          = local.code_drop_url,
  }
  combined_settings = merge(local.required_settings, var.service_settings.app_settings)

  merged_service_settings = {
    name              = var.service_settings.name
    runtime_version   = var.service_settings.runtime_version
    runtime_type      = var.service_settings.runtime_type
    app_settings      = local.combined_settings
    plan_id           = var.host_settings.plan_id
    storage_account   = var.host_settings.storage_account
  }
}

module "api_fn" {
  
  source                        = "../../../../../../../services/fn/premium/base/v1.3"
  
  context = var.context
  service_settings = local.merged_service_settings
  observability_settings = var.observability_settings

}

module "identity_access_policy" {
  
  source                    = "github.com/persistentsystems/terraform-azurerm/services/keyvault/accesspolicy/templates/managed-identity-reader/v1"

  keyvault_id               = var.host_settings.keyvault_id
  object_id                 = module.api_fn.identity[0].principal_id

}
