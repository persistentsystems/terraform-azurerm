variable "context" {
  type = object({

    application_name    = string
    environment_name    = string
    resource_group_name = string

    location            = object({
      name   = string
      suffix = string
      number = number
    })

  })
}

variable "service_settings" {
  type = object({

    endpoint              = string
    logger                = string

    api = object({
    
      name                  = string
      description           = string
      revision              = string
      path                  = string
      service_url           = string

      products              = list(string)
      subscription_required = bool

      policies = object({

        inbound          = string
        outbound         = string
        backend          = string
        error            = string

      })

    })

  })
}