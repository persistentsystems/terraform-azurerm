locals {
    
  policy_xml = <<XML
<policies>
  <inbound>
    ${var.service_settings.op.policies.inbound}
    <base />
  </inbound>    
  <backend>
    ${var.service_settings.op.policies.backend}
    <base />
  </backend>
  <outbound>
    ${var.service_settings.op.policies.outbound}
    <base />
  </outbound>
  <on-error>
    ${var.service_settings.op.policies.error}
    <base />
  </on-error>
</policies>
XML
}

resource "azurerm_api_management_api_operation_policy" "api_op_policy" {

  resource_group_name = var.context.resource_group_name

  api_management_name = var.service_settings.endpoint
  api_name            = var.service_settings.api
  operation_id        = azurerm_api_management_api_operation.op.operation_id

  xml_content         = local.policy_xml

}