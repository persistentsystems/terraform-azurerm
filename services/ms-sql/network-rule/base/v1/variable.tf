variable "vnet_rule" {
    type = object({
        name      = string
        server_id = string
        subnet_id = string
    })
  
}