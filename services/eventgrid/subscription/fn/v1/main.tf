
locals {
  webhook_endpoint = "https://${var.endpoint_settings.hostname}/runtime/webhooks/eventGrid?functionName=${var.endpoint_settings.function_name}&code=${var.endpoint_settings.eventgrid_key}"
}

resource "azurerm_eventgrid_event_subscription" "subscription" {
  name                 = var.service_settings.name
  scope                = var.service_settings.topic_id

  included_event_types = var.service_settings.included_event_types

  webhook_endpoint {
    url = local.webhook_endpoint
  }

}