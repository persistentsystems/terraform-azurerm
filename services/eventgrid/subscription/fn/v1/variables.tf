variable "context" {
  type = object({

    application_name    = string
    environment_name    = string
    resource_group_name = string
    location            = string
    location_suffix     = string

  })
}
variable "service_settings" {
  type = object({

    name                 = string
    topic_id             = string
    included_event_types = list(string)

  })
}
variable "endpoint_settings" {
  type = object({
    hostname             = string
    function_name        = string
    eventgrid_key        = string
  })
}
variable "observability_settings" {
  type = object({
    instrumentation_key       = string
    workspace_id              = string
  })
}