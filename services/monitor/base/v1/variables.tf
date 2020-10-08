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

    name                = string
    short_name          = string

  })
}

variable "email_settings" {
    type = list(object({
      email_title    = string
      email_address = string
    }))
}

variable "custom_rules_settings" {
    type = object({
        name                = string
        scopes              = list(string)
        description         = string
        metric_namespace    = string
        metric_name         = string
        aggregation         = string
        operator            = string
        threshold           = string
        dimensions_name     = string
        dimensions_operator = string
        values              = list(string)
    })
}