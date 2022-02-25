variable "service_settings" {
  type = object({
    name                    = string
    resource_group_name     = string
    virtual_network_name    = string
    remote_virtual_network_id      = string
  })
}
