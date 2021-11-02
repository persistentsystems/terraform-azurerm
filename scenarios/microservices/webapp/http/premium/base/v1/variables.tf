variable "context" {
  type = object({

    application_name            = string
    environment_name            = string
    resource_group_name = string
    location            = string
    location_suffix     = string

  })
}
variable "host_settings" {
  type = object({

    plan_id                         = string
    storage_account                 = object({
        connection_string = string
        name = string
        access_key = string
    })
    deployment_storage_account_name = string
    deployment_storage_container    = string
    deployment_package_sas          = string

  })
}
variable keyvault_id {
    type = string
}
variable "service_settings" {
  type = object({

    name              = string
    app_settings      = map(string)
    package_filename  = string

  })
}

variable "observability_settings" {
  type = object({
    instrumentation_key = string 
    retention_in_days   = number
    

  })
}
variable tags {

  type = map
    
}
