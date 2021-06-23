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
    name            = string
    description     = string
    scope           = string
    operation_name  = string
    category        = string
    action_group_id = string
  })
}