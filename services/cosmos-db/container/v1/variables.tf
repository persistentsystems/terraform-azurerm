
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

    account_name        = string
    database_name       = string
    name                = string
    partition_key_path  = string
  })
}