
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



  })
}

variable "container" {
  type = list(object({
    name = string
    partition_key_path = string
    name              = string
    account_name      = string
    throughput        = string

  }))
}