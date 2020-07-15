

locals {

  required_settings = {
      "APPINSIGHTS_INSTRUMENTATIONKEY"    = var.host_settings.instrumentation_key,
      "WEBSITE_RUN_FROM_PACKAGE"          = local.code_drop_url,
      "ClientID"                          = var.service_settings.client_id,
      "ClientSecret"                      = var.service_settings.client_secret
  }
  combined_settings = merge(local.required_settings, var.fn_settings.app_settings)

  merged_service_settings = {
    name              = var.service_settings.name
    runtime_version   = var.service_settings.runtime_version
    runtime_type      = var.service_settings.runtime_type
    app_settings      = local.combined_settings
    plan_id = var.host_settings.plan_id
    
  }
}
    name                      = string
    runtime_version           = string
    runtime_type              = string
    app_settings              = map(string)
    plan_id                   = string
    storage_connection_string = string

module "api_fn" {
  
  source                        = "../../../../../../../services/fn/premium/base/v1"
  
  context = var.context
  host_settings = var.host_settings
  service_settings = local.merged_service_settings

}