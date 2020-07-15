  
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

    name            = string
    storage_type = string
    workspace_id = string
    maximum_instance_count = int
    minimum_instance_count = int

  })
  default = {
    storage_type = "GRS"
    maximum_instance_count = 1
    minimum_instance_count = 1
  }
}