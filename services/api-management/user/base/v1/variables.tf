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

    endpoint_name = string
    user_id       = string
    first_name    = string
    last_name     = string
    email         = string
    email         = string

  })
}