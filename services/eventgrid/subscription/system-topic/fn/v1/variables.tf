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

    name                   = string
    system_topic_name      = string
    included_event_types   = list(string)
    advanced_filtering_on_arrays_enabled = bool
  })
}

variable "endpoint_settings" {
  type = object({
    functionapp_name        = string
    function_name           = string
  })
}