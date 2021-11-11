variable "context" {
  type = object({

    application_name            = string
    environment_name            = string
    resource_group_name         = string
    location                    = string
    location_suffix             = string

  })
}
variable "service_settings" {
  type = object({
    name                      = string
    plan_id                   = string
    dotnet_version            = string
    app_settings              = map(string)      

  })
}
variable tags {

  type = map
    
}


