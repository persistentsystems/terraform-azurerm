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

    name            = string
    publisher_name  = string
    publisher_email = string
    sku_name        = string
    log_storage_account = string

  })
}
variable "observability_settings" {
  type = object({
    instrumentation_key       = string
    workspace_id              = string
    storage_account           = string 
    retention_days            = number
  })
}

variable "policies" {
  type = object({
    inbound          = string
    outbound         = string
    backend          = string
    error            = string
  })
}

variable tags {

  type = map
    
}