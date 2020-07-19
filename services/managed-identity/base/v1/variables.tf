  
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

    name                      = string

  })
}