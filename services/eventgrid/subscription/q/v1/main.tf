
locals {
  webhook_endpoint = "https://${var.service_settings.hostname}/runtime/webhooks/EventGrid?functionName=${var.service_settings.function_name}&code=${var.service_settings.eventgrid_key}"
}

resource "azurerm_eventgrid_event_subscription" "subscription" {
  name                 = var.service_settings.name
  scope                = var.service_settings.topic_id

  included_event_types = var.service_settings.included_event_types

  storage_queue_endpoint {
    storage_account_id = var.endpoint_settings.queue_storage_id
    queue_name         = var.endpoint_settings.queue_name
  }

}