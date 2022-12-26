  
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

    name                = string

  })
}

variable "observability_settings" {
  type = object({

    #instrumentation_key = string
    workspace_id        = string
    #storage_account     = string 
    retention_days      = number
    #storage_account_id  = string
  })
}
variable "soft_delete_retention_days"{
  type = number
  default = 90
}

variable tags {

  type = map
    
}