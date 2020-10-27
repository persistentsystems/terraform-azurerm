variable "context" {
  type = object({
    application_name    = string
    environment_name    = string
    resource_group_name = string
    location            = string
    location_suffix     = string
  })
}

variable "custom_rules_settings" {
    type = object({
        name                = string
        description         = string
        action_group        = list(string)
        data_source_id      = string
        query               = string
        severity            = string
        frequency           = string
        time_window         = string
        operator            = string
        threshold           = string
    })
}
