data "azurerm_client_config" "current" {}

resource "azurerm_api_management_api" "api" {

  resource_group_name = var.context.resource_group_name

  api_management_name = var.service_settings.endpoint_name

  revision            = var.service_settings.revision
  name                = var.service_settings.name
  display_name        = var.service_settings.description
  path                = var.service_settings.path
  protocols           = [var.service_settings.primary_protocol]

}

resource "azurerm_api_management_api_diagnostic" "api" {
  
  resource_group_name      = var.context.resource_group_name
  api_management_name      = var.service_settings.endpoint_name
  api_name                 = azurerm_api_management_api.api.name
  api_management_logger_id = azurerm_api_management_logger.api_logger_id
}

module "api_insights" {

  source              = "../../../endpoint/base/v1.2"
  context             = var.context
  name                = azurerm_api_management_logger.app_insights.id
  api_management_name = var.service_settings.endpoint_name
  
/*
  application_insights {
    instrumentation_key = var.observability_settings.instrumentation_key
  }
*/
}
