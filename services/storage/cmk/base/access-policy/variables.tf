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
# type = "GRS"
variable "service_settings" {
  type = object({
    key_vault_id                  = string
    object_id                  = string

  })
}