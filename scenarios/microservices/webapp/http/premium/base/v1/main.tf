

locals {

  required_settings = {
      "WEBSITE_RUN_FROM_PACKAGE"          = local.code_drop_url,
  }
  combined_settings = merge(local.required_settings, var.service_settings.app_settings)

  merged_service_settings = {
    name                = var.service_settings.name
    dotnet_version      = var.service_settings.dotnet_version
    app_settings        = local.combined_settings   
  }
}

module "api_webapp" {
  
  source                  = "../../../../../../../services/admin-ui/base/v1"
  
  context                = var.context
  service_settings       = local.merged_service_settings
  observability_settings = var.observability_settings  
  tags                   = var.tags
  
}

# module "identity_access_policy" {
  
#   source                    = "../../../../../../../services/keyvault/accesspolicy/templates/managed-identity-reader/v1"

#   keyvault_id               = var.keyvault_id
#   object_id                 = module.api_webapp.identity[0].principal_id

# }
