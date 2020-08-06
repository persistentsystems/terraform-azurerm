locals {
    
  policy_xml = <<XML
<policies>
  <inbound>
    ${var.policies.inbound}
    <choose>
            <when condition="@(context.Api.Path.Contains("rx"))">
                <set-backend-service id="tf-generated-policy" backend-id="${var.service_settings.backend1_name}" />
            </when>
            <when condition="@(context.Api.Path.Contains("providerUpload"))">
                <set-backend-service id="tf-generated-policy" backend-id="${var.service_settings.backend2_name}" />
            </when>
    </choose>
    <base />
  </inbound>    
  <backend>
    ${var.policies.backend}
    <base />
  </backend>
  <outbound>
    ${var.policies.outbound}
    <base />
  </outbound>
  <on-error>
    ${var.policies.error}
    <base />
  </on-error>
</policies>
XML
}


resource "azurerm_api_management_api_policy" "api_policy" {

  resource_group_name = var.context.resource_group_name

  api_name            = azurerm_api_management_api.api.name
  api_management_name = var.service_settings.endpoint_name

  xml_content         = local.policy_xml

}
