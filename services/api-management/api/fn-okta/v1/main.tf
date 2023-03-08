data "azurerm_client_config" "current" {}

locals {

  jwt_authentication = <<XML
    <validate-jwt header-name="Authorization" failed-validation-httpcode="401" failed-validation-error-message="Unauthorized. Access token is missing or invalid.">
      <openid-config url="https://${var.okta_settings.domainname}/oauth2/${var.okta_settings.serverid}/.well-known/oauth-authorization-server" />
      <required-claims>
          <claim name="aud">
              <value>${var.okta_settings.audience}</value>
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
  
  source                = "../../fn/v1"
  
  context          = var.context
  service_settings = var.service_settings
  policies         = local.merged_policies
  backend_settings = var.backend_settings
  observability_settings = var.observability_settings
}
