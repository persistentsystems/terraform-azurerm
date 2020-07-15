variable "context" {
  type = object({

    application_name            = string
    environment_name            = string
    resource_group_name = string
    location            = string
    location_suffix     = string

  })
}
variable "service_settings" {
  type = object({

    name                      = string
    runtime_version           = string
    runtime_type              = string
    app_settings              = map(string)
    plan_id                   = string
    storage_connection_string = string

  })
}