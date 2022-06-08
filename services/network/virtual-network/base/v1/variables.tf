variable "context" {
  type = object({
    application_name    = string
    environment_name    = string
    resource_group_name = string
    location_suffix     = string
    location            = string   
   })
}

variable "vnet_name" {
  type = string
}
variable "address_space" {
  type = list(string)
  
}
variable tags {
  type = map    
}

variable "observability_settings" {
  type = object({

    #instrumentation_key = string
    workspace_id        = string
    storage_account     = string 
    retention_days      = number
    #storage_account_id  = string
  })
}