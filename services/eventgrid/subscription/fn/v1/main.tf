
locals {
  webhook_endpoint = "https://${var.endpoint_settings.hostname}/runtime/webhooks/EventGrid?functionName=${var.endpoint_settings.function_name}&code=${var.endpoint_settings.eventgrid_key}"
}

resource "azurerm_eventgrid_event_subscription" "subscription" {
  name                 = var.service_settings.name
  scope                = var.service_settings.topic_id

  included_event_types = var.service_settings.included_event_types

  webhook_endpoint {
    url = local.webhook_endpoint
  }

}

resource "time_sleep" "wait_90_seconds" {
  depends_on = [azurerm_eventgrid_topic.topic.id]

  create_duration = "90s"
}

# This resource will create (at least) 90 seconds after null_resource.previous
resource "null_resource" "next" {
  depends_on = [time_sleep.wait_30_seconds]
}