

locals {

  required_settings = {
      "APPINSIGHTS_INSTRUMENTATIONKEY"    = var.host_settings.instrumentation_key,
      "WEBSITE_RUN_FROM_PACKAGE"          = local.code_drop_url,
      "ClientID"                          = var.service_settings.client_id,
      "ClientSecret"                      = var.service_settings.client_secret
  }
  combined_settings = merge(local.required_settings, var.fn_settings.app_settings)

  merged_fn_settings = {
    name              = var.service_settings.name
    service_name      = var.service_settings.service_name
    runtime_version   = var.service_settings.runtime_version
    runtime_type      = var.service_settings.runtime_type
    app_settings      = local.combined_settings
    package_filename  = var.service_settings.package_filename
    workspace_id      = var.service_settings.workspace_id
    client_id         = var.service_settings.client_id
    client_secret     = var.service_settings.client_secret
  }
}


module "api_fn" {
  
  source                        = "github.com/markti/tf_azure_fn/http/premium_v2020-06-30"
  
  environment = var.environment
  host_settings = var.host_settings
  fn_settings = local.merged_fn_settings

}