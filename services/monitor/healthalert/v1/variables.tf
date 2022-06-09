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
        scopes              = list(string)
        description         = string
        level               = string
        #status              = string
        #sub_status          = string
        category            = string
        action_group_id     = string
        current_status      = list(string)
        previous_status     = list(string)
        reason              = list(string)
    })
}