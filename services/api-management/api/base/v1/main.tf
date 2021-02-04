data "azurerm_client_config" "current" {}

resource "azurerm_api_management_api" "api" {

  resource_group_name = var.context.resource_group_name

  api_management_name = var.service_settings.endpoint

  name                = var.service_settings.api.name
  display_name        = var.service_settings.api.description
  revision            = var.service_settings.api.revision
  path                = var.service_settings.api.path
  service_url         = var.service_settings.api.service_url

  protocols           = [ "https" ]

  subscription_required = var.service_settings.api.subscription_required

}

resource "azurerm_api_management_api_diagnostic" "api" {
  
  identifier               = "applicationinsights"
  resource_group_name      = var.context.resource_group_name
  api_management_name      = var.service_settings.endpoint
  api_name                 = azurerm_api_management_api.api.name
  api_management_logger_id = var.service_settings.logger

}