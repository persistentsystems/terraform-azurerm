variable "context" {
  type = object({

    application_name    = string
    environment_name    = string
    resource_group_name = string
    location            = string
    location_suffix     = string

  })
}
variable "dns_zone_settings" {
  type = object({

    name                    = string
    vnet_id                 = string
    private_dns_zone_name   = string
  }) 

}

