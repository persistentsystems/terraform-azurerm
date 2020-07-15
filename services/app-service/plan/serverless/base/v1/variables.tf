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
    storage_type           = string

  })
}