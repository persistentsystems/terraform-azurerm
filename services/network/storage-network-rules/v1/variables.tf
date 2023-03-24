variable "service_settings" {
    type = object({
        storage_account_id = string
        default_action     = string
        ip_rules           = string
        virtual_network_subnet_ids = string

    })
  
}