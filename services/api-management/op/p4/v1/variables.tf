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
    api_name      = string
    backend_name  = string

  })
}
variable "operation_settings" {
  type = object({

    operation_id = string
    display_name = string
    description  = string
    method       = string
    url_template = string

  })
}
variable "parameters" {
  type = object({

    p1 = string
    p2 = string
    p3 = string
    p4 = string

  })
}