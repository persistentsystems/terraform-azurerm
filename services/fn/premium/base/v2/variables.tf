variable "context" {
  type = object({

    application_name            = string
    environment_name            = string
    resource_group_name = string
    location            = string
    location_suffix     = string

  })
}
variable "service_settings" {
  type = object({

    name                      = string
    runtime_version           = string
    runtime_type              = string
    app_settings              = map(string)
    plan_id                   = string
    ftps_state                = string
    linux_fx_version          = string
    storage_account = object({
        connection_string = string
        name = string
        access_key = string
    })

  })
}
variable "observability_settings" {
  type = object({

    instrumentation_key = string
    workspace_id        = string
    storage_account     = string 
    retention_in_days   = number
    storage_account_id  = string
  })
}
variable "ip_rules_settings" {
    type = object({
      user_defined_iplist       = list(string)
      apim_iplist               = list(string)
      services_iplist           = map(list(string))
    })
    default = {
       user_defined_iplist = []
       apim_iplist         = []
       services_iplist     = {
                         "us-east" = []
                         "us-west" = []
                         "us-north" = []
                         "us-south" = []
                        }
                 }
}
variable tags {

  type = map
    
}
# variable "ftps_state"{
#   type    = string
#   default = "FtpsOnly"
# }

