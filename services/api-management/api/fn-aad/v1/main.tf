data "azurerm_client_config" "current" {}

locals {

  jwt_authentication = <<XML
    <validate-jwt header-name="Authorization" failed-validation-httpcode="401" failed-validation-error-message="Unauthorized. Access token is missing or invalid.">
      <openid-config url="https://login.microsoftonline.com/${data.azurerm_client_config.current.tenant_id}/.well-known/openid-configuration" />
      <required-claims>
          <claim name="aud">
              <value>${var.aad_settings.scope}</value>
          </claim>
      </required-claims>
    </validate-jwt>
XML

  merged_policies = {

    inbound          = var.inbound + "\n" + local.jwt_authentication
    outbound         = var.outbound
    backend          = var.backend
    error            = var.error

  }

}


module "api" {
  
  source                = "../../fn/v1"
  
  context          = var.context
  service_settings = {

    endpoint_name    = var.service_settings.endpoint_name
    name             = var.service_settings.name
    description      = var.service_settings.description
    revision         = var.service_settings.revision
    path             = var.service_settings.path
    primary_protocol = var.service_settings.primary_protocol
    publish          = var.service_settings.publish
    product_id       = var.service_settings.product_id
    backend_name     = module.backend.name

  }
  policies         = local.merged_policies
  backend_settings = var.backend_settings

}