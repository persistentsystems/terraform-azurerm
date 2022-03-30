
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
    name                            = string
    primary_server_id               = string
    secondary_server_id             = string
    primary_database_id             = string
    mode                            = string
    grace_minutes                   = string 
  })
}

variable tags {

  type = map
    
}