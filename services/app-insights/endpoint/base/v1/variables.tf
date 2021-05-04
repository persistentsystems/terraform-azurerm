
variable "context" {
  type = object({

    application_name = string
    environment_name = string
    resource_group_name = string
    location = string
    location_suffix = string

  })
}

# storage_type = "GRS"
# maximum_instance_count = 1
# minimum_instance_count = 1
variable "service_settings" {
  type = object({

    name              = string
    retention_in_days = number

  })
}

variable tags {

  type = map
    
}