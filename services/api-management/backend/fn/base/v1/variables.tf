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

    name          = string
    endpoint_name = string
    function_name = string
    function_key  = string
    protocol      = string

  })
}