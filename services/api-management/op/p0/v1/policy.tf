resource "azurerm_api_management_api_operation_policy" "op_policy" {
  api_name            = var.service_settings.api_name
  api_management_name = var.service_settings.endpoint_name
  resource_group_name = var.context.resource_group_name
  operation_id        = azurerm_api_management_api_operation.op.operation_id

  xml_content = <<XML
<policies>
  <inbound>
    <base />
  </inbound>
</policies>
XML
}