
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
    administrator_login_password    = string
    minimum_tls_version             = string
    identity                        = string 
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