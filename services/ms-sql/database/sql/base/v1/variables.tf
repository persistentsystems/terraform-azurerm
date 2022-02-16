
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

    name              = string
    server_id         = string    
    license_type      = string
    max_size_gb       = string
    sku_name          = string
    tier              = string
    family            = string
    capacity          = string
    zone_redundant    = bool
    min_capacity      = string
    max_capacity      = string

  })
}

variable tags {

  type = map
    
}