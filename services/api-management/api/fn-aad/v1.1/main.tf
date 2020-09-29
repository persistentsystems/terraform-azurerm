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

    inbound          = "${var.policies.inbound} \n ${local.jwt_authentication}"
    outbound         = var.policies.outbound
    backend          = var.policies.backend
    error            = var.policies.error

  }

}


module "api" {
  
  source                = "../../fn/v1.1"
  
  context          = var.context
  service_settings = var.service_settings
  policies         = local.merged_policies
  backend_settings = var.backend_settings
}
