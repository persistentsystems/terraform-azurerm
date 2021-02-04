# Application Insights Logging in API Management
resource "azurerm_api_management_logger" "app_insights" {

  name                = "${var.service_settings.name}-appinsights-logger"
  api_management_name = azurerm_api_management.apim.name
  resource_group_name = var.context.resource_group_name

  application_insights {
    instrumentation_key = var.observability_settings.instrumentation_key
  }

}