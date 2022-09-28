variable "context" {
  type = object({

    application_name    = string
    environment_name    = string
    resource_group_name = string
    location            = string
    location_suffix     = string

  })
}

variable "observability_settings" {
  type = object({
    name                = string
    target_resource_id  = string
    instrumentation_key = string
    workspace_id        = string
    storage_account     = string 
    retention_days      = number
    workspace_name  = string
  })
}