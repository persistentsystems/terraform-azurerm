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

    name       = string
    short_name = string
    
    subscriber_name = string
    subscriber_email = string

    #subscribers = list(object({
    #  name  = string
    #  email = string
    #}))

  })
}