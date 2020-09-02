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

    name  = string

  })
}

variable "policy_settings" {
    type = object({
        custom_block_response_status_code   = number 
        custom_block_response_body          = string 
        mode                                = string
        redirect_url                        = string

    })
}

variable "managed_rules_settings" {
    type = list(object({
        type    = string
        version = string
    }))
}


variable "custom_rules_settings" {
    type = object({
          name                           = string
          enabled                        = bool
          priority                       = string
          rate_limit_duration_in_minutes = string
          rate_limit_threshold           = string
          type                           = string
          action                         = string
    })
}


variable "match_condition_settings" {
    type = list(object({
          match_variable                 = string
          operator                       = string
          negation_condition             = bool
          match_values                   = string
  }))
}
