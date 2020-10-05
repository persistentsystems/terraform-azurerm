
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

    name              = string
    account_name      = string
    throughput        = string
    max_throughput    = string

  })
}

variable "container" {
  type = object({
    name = string
    partition_key_path = string

  })
}