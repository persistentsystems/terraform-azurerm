variable "context" {
  type = object({

    application_name            = string
    environment_name            = string
    resource_group_name = string
    location            = string
    location_suffix     = string

  })
}
variable "service_settings" {
  type = object({

    name                      = string
    runtime_version           = string
    runtime_type              = string
    app_settings              = map(string)
    plan_id                   = string
    storage_account = object({
        connection_string = string
        name = string
        access_key = string
    })

  })
}
variable "observability_settings" {
  type = object({
    instrumentation_key       = string
    workspace_id              = string
  })
}

variable "https_only" {
  type        = bool
  default     = true
}
