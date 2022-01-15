variable "context" {
  type = object({
    application_name    = string
    environment_name    = string
    resource_group_name = string
    location_suffix     = string
    location            = string   
   })
}

variable "service_settings" {
  type = object({

    subnet_id       = string
    nsg_id          = string
    

  })
}