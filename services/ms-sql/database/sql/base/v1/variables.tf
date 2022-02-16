
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
    name                      = string
    server_id                 = string
    collation                 = string
    license_type              = string
    max_size_gb               = string
    #read_scale                = bool
    sku_name                  = string
    zone_redundant            = bool
    storage_endpoint          = string
    storage_account_access_key = string
    retention_in_days          = string
    auto_pause_delay_in_minutes = string
    min_capacity               = string

  })
}

variable tags {

  type = map
    
}