variable "context" {
  type = object({

    application_name    = string
    environment_name    = string
    resource_group_name = string

    location            = object({
      name = string
      suffix = string
      number = number
    })

  })
}

variable "service_settings" {
  type = object({

    endpoint = string
    name     = string

    backend = object({
      
      protocol = string
      url      = string
      
    })

  })
}