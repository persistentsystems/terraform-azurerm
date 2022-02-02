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

    keyvault_id     = string
    name            = string
    expiration_date = string
  })
}
#variable "application_id" { }