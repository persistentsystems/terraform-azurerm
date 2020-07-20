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

    endpoint_name    = string
    name             = string
    description      = string
    revision         = bool
    path             = bool
    primary_protocol = number
    publish          = bool
    product_id       = string

  })
}
variable "policies" {
  type = object({

    inbound          = string
    outbound         = string
    backend          = string
    error            = string

  })
}
variable "backend_settings" {
  type = object({

    function_name = string
    function_key  = string
    protocol      = string

  })
}