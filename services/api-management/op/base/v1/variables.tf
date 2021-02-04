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
    api      = string

    op = object({
      
      id          = string
      name        = string
      description = string
      method      = string
      route       = string

      parameters = list(object({
        name     = string
        required = string
        type     = string
      }))

      policies = object({
        inbound  = string
        outbound = string
        backend  = string
        error    = string
      })
      
    })

  })
}