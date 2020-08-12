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
        custom_block_response_status_code = number 
        custom_block_response_body = string 
        mode = string
        redirect_url = string

    })
}

variable "managed_rule_set" {
    managed_rule {
      type    = string
      version = string
    }
}

variable "custom_rule_set" {
    custom_rule {
        name = string
        enabled = bool
        priority = number

        match_condition {
            match_variable     = string
            operator           = string
            negation_condition = bool
            match_values       = string
    }
  }
}
