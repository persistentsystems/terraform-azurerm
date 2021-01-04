# User Story 3272 adding Function as endpoint
data "azuread_client_config" "current" {}

resource "azurerm_eventgrid_event_subscription" "subscription" {
  name                 = var.service_settings.name
  scope                = var.service_settings.topic_id
  included_event_types = var.service_settings.included_event_types

  azure_function_endpoint {
      function_id = "/subscriptions/${data.azuread_client_config.current.subscription_id}/resourceGroups/${var.context.resource_group_name}/providers/Microsoft.Web/sites/${var.endpoint_settings.function_name}/functions/${var.func_name.name}"  
  }

}