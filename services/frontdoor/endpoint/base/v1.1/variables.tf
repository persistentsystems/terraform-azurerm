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

    name         = string
    workspace_id = string
    log_storage_account = string

  })
}
variable "primary_backend" {
  type = object({

    host_header      = string
    address          = string
    http_port        = string
    https_port       = string

  })
}
variable "secondary_backend" {
  type = object({

    host_header      = string
    address          = string
    http_port        = string
    https_port       = string

  })
}
variable "backend_settings" {
  type = object({

    name = string
    healthprobe_path = string

  })
}

variable "observability_settings" {
  type = object({

    workspace_id        = string
    storage_account     = string 
    retention_days      = number
  })
}
