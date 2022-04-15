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

    server_id             = string
    key_vault_key_id      = string
    
  })
}