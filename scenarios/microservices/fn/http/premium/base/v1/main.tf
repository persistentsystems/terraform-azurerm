

locals {

  required_settings = {
      "WEBSITE_RUN_FROM_PACKAGE"          = local.code_drop_url,
  }
  combined_settings = merge(local.required_settings, var.service_settings.app_settings)

  merged_service_settings = {
    name                = var.service_settings.name
    runtime_version     = var.service_settings.runtime_version
    runtime_type        = var.service_settings.runtime_type
    app_settings        = local.combined_settings
    plan_id             = var.host_settings.plan_id
    storage_account     = var.host_settings.storage_account
    storage_account_id  = var.observability_settings.storage_account_id
    patientmatch_virtual_network_subnet_id = var.service_settings.patientmatch_virtual_network_subnet_id
    patientmatch_restriction_name          = var.service_settings.patientmatch_restriction_name
    patientmatch_priority                  = var.service_settings.patientmatch_priority
    patientmatch_action                    = var.service_settings.patientmatch_action
    fn_virtual_network_subnet_id           = var.service_settings.fn_virtual_network_subnet_id
    fn_restriction_name                    = var.service_settings.fn_restriction_name
    fn_priority                            = var.service_settings.fn_priority
    fn_action                              = var.service_settings.fn_action

  }
}

module "api_fn" {
  
  source                  = "../../../../../../../services/fn/premium/base/v1"
  
  context                = var.context
  service_settings       = local.merged_service_settings
  observability_settings = var.observability_settings
  ip_rules_settings      = var.ip_rules_settings
  tags              = var.tags
  
}

module "identity_access_policy" {
  
  source                    = "../../../../../../../services/keyvault/accesspolicy/templates/managed-identity-reader/v1"

  keyvault_id               = var.keyvault_id
  object_id                 = module.api_fn.identity[0].principal_id

}
