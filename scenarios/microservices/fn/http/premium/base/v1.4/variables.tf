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
    instrumentation_key             = string
    keyvault_id                     = string
    keyvault_uri                    = string
    deployment_storage_account_name = string
    deployment_storage_container    = string
    deployment_package_sas          = string

  })
}
variable "service_settings" {
  type = object({

    name              = string
    service_name      = string
    runtime_version   = string
    runtime_type      = string
    app_settings      = map(string)
    package_filename  = string

  })
}
variable "observability_settings" {
  type = object({
    instrumentation_key       = string
    workspace_id              = string
  })
}
variable "ip_rules_settings" {
  type = object({
    user_defined_iplist       = list(string)
    apim_iplist               = list(string)
    services_iplist           = map(list(string))
  })
}
