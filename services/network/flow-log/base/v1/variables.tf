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
    network_watcher_name                = string
    network_watcher_resource_group_name = string
    name                                = string
    network_security_group_id           = string
    storage_account_id                  = string
    enabled                             = bool
    version                             = number
  })
  
}

variable "traffic_analytics" {
  type = object({
   enabled                 = bool
   workspace_id            = string
   workspace_region        = string
   workspace_resource_id   = string 
   interval_in_minutes     = number
   })
}
