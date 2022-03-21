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
    version                         = string
    administrator_login             = string
    administrator_password          = string
    #zone                            = string
    storage_mb                      = number
    sku_name                        = string
    backup_retention_days           = string
    #delegated_subnet_id             = string
    #private_dns_zone_id             = string
  })
}

variable "observability_settings" {
  type = object({
    workspace_id              = string
    storage_account           = string 
    retention_days            = number
  })
}

variable tags {

  type = map
    
}
variable "firewall_rule_settings" {
  type = object({
    start_ip_address          = string 
    end_ip_address            = string
  })
} 
