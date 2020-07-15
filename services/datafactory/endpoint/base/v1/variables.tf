variable "environment" {
  type = object({

    app_name            = string
    env_name            = string
    resource_group_name = string
    location            = string
    location_suffix     = string

  })
}
variable "service_settings" {
  type = object({

    name            = string

  })
}