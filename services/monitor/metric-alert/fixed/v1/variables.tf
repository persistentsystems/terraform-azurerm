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

variable "actions" {
  type = object({
    
    ids = list(string)

  })
}

variable "metric" {
  type = object({

    scopes    = list(string)
    namespace = string
    name      = string

  })
}

variable "threshold" {
  type = object({

    operator    = string
    aggregation = string
    value       = number
    severity    = number

    dimensions   = list(object({

      name     = string
      operator = string
      values   = list(string)

    }))

  })
}