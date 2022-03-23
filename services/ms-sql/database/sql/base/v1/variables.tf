
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
    name                          = string
    server_id                     = string
    collation                     = string 
    max_size_gb                   = string
    sku_name                      = string
    auto_pause_delay_in_minutes   = string
    min_capacity                  = string

  })
}

# variable "observability_settings" {
#   type = object({    
#     workspace_id        = string
#     storage_account     = string 
#     retention_days      = number   

#   })
# }

variable tags {

  type = map
    
}