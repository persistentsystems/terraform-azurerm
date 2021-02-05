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

    enabled = bool

    policy = object({
        custom_block_response_status_code   = number 
        custom_block_response_body          = string 
        mode                                = string
        redirect_url                        = string
    })

    managed_rulesets = list(object({
        type    = string
        version = string
    }))

    custom_rules = list(object({
          name                           = string
          enabled                        = bool
          priority                       = number
          rate_limit_duration_in_minutes = number
          rate_limit_threshold           = number
          type                           = string
          action                         = string
          match_variable                 = string
          operator                       = string
          negation_condition             = bool
          match_values                   = list(string)
    }))

  })
}