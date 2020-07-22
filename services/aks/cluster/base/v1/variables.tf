variable "context" {
  type = object({

    application_name    = string
    environment_name    = string
    resource_group_name = string
    location            = string
    location_suffix     = string

  })
}
# node_size = "Standard_D2_v2"
variable "service_settings" {
  type = object({

    name                = string
    resource_group_name = string
    node_count          = number
    node_size           = string

  })
}