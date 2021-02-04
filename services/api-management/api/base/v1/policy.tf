locals {
    
  policy_xml = <<XML
<policies>
  <inbound>
    ${var.service_settings.api.policies.inbound}
    <base />
  </inbound>    
  <backend>
    ${var.service_settings.api.policies.backend}
    <base />
  </backend>
  <outbound>
    ${var.service_settings.api.policies.outbound}
    <base />
  </outbound>
  <on-error>
    ${var.service_settings.api.policies.error}
    <base />
  </on-error>
</policies>
XML
}


resource "azurerm_api_management_api_policy" "api_policy" {

  resource_group_name = var.context.resource_group_name

  api_name            = azurerm_api_management_api.api.name
  api_management_name = var.service_settings.endpoint

  xml_content         = local.policy_xml

}