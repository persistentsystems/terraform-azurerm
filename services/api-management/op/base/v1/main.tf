resource "azurerm_api_management_api_operation" "op" {
  
  resource_group_name = var.context.resource_group_name

  api_name            = var.service_settings.api
  api_management_name = var.service_settings.endpoint

  operation_id        = var.service_settings.op.id
  display_name        = var.service_settings.op.name
  description         = var.service_settings.op.description
  method              = var.service_settings.op.method
  url_template        = var.service_settings.op.route

  response {
    status_code = 200
  }

  dynamic "template_parameter" {
    for_each = var.service_settings.op.parameters
      content {
        
        name     = template_parameter.value.name
        required = template_parameter.value.priority
        type     = template_parameter.value.type

      }
  }

}