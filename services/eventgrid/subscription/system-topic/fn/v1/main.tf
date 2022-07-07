data "azuread_client_config" "current" {}

resource "azurerm_eventgrid_system_topic_event_subscription" "system_topic_event_subscription" {
  name                 = var.service_settings.name
  system_topic         = var.service_settings.system_topic_name
  resource_group_name  = var.context.resource_group_name
  included_event_types = var.service_settings.included_event_types
  advanced_filtering_on_arrays_enabled = var.service_settings.advanced_filtering_on_arrays_enabled
  azure_function_endpoint {
    function_id = "/subscriptions/${data.azuread_client_config.current.subscription_id}/resourceGroups/${var.context.resource_group_name}/providers/Microsoft.Web/sites/${var.endpoint_settings.functionapp_name}/functions/${var.endpoint_settings.function_name}"
  }
}