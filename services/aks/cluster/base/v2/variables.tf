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
    node_min_count      = number
    node_max_count      = number 
    node_size           = string
    rbac_enabled        = bool 
    enable_pod_security_policy = bool 
    api_server_authorized_ip_ranges = list(string)
    kubernetes_version  = string
    vnet_subnet_id      = string

  })
}
variable "observability_settings" {
  type = object({
    instrumentation_key       = string
    workspace_id              = string
    storage_account           = string 
    retention_days            = number
  })
}

variable tags {

  type = map
    
}