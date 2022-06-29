
variable "context" {
  type = object({

    application_name = string
    environment_name = string
    resource_group_name = string
    location = string
    location_suffix = string

  })
}

variable "service_settings" {
  type = object({
    name                        = string
    automation_account_name     = string
    expiry_time                 = string
    enabled                     = bool
    runbook_name                = string
    AppName                     = string
    EnvName                     = string
    to_email                    = string
    from_email                  = string
  })
}