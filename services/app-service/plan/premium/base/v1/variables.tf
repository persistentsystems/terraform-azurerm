variable "context" {
  type = object({

    application_name    = string
    environment_name    = string
    resource_group_name = string
    location            = string
    location_suffix     = string

  })
}
# tier = "Standard"
# size = "EP1"
# storage_type = "GRS"
variable "service_settings" {
  type = object({

    name                   = string
    size                   = string
    storage_type           = string
    maximum_instance_count = number
    #minimum_instance_count = number

  })
}

variable tags {

  type = map
    
}

variable "observability_settings" {
  type = object({

    instrumentation_key = string
    workspace_id        = string
    storage_account     = string 
    retention_days      = number
    workspace_name  = string
  })
}