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

    name                                    = string
    workspace_id                            = string
    
  })
}
variable "primary_backend" {
  type = object({

    host_header      = string
    address          = string
    http_port        = string
    https_port       = string
    priority         = number

  })
}
variable "secondary_backend" {
  type = object({

    host_header      = string
    address          = string
    http_port        = string
    https_port       = string
    priority         = number

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
    storage_account_id  = string 
    retention_days      = number
  })
}

/*
variable "web_application_firewall_policy_link_id" { 
  type = string
}
*/