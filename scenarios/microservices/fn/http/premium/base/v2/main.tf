

locals {

  required_settings = {
      "APPINSIGHTS_INSTRUMENTATIONKEY"    = var.host_settings.instrumentation_key,
      "WEBSITE_RUN_FROM_PACKAGE"          = local.code_drop_url,
      "ClientID"                          = var.service_settings.client_id,
      "ClientSecret"                      = var.service_settings.client_secret
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
  
  source                        = "../../../../../../../services/fn/premium/base/v1"
  
  context = var.context
  service_settings = local.merged_service_settings
  identity_settings = var.identity_settings

}