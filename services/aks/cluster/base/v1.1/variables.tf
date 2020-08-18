variable "context" {
  type = object({

    application_name    = string
    environment_name    = string
    resource_group_name = string
    location            = string
    location_suffix     = string

  })
}
# There are a lot of parameters, and some i'm omitting to keep 
# the parameter list manageable.  There is an open ticket in github
# Aug 2020, that is trying to address having default values for 
# objects.  Waiting for this before adding even more options.
variable "service_settings" {
  type = object({

    name                = string
    resource_group_name = string
    node_count          = number
    node_min_count      = number
    node_max_count      = number 
    node_size           = string
    rbac_enabled        = bool 
    enable_pod_security_policy = bool 

  })
}
variable "observability_settings" {
  type = object({
    workspace_id              = string
    workspace_name            = string 
  })
}
