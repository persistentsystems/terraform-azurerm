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

    name                    = string 
    vm_size                 = string
    kubernetes_cluster_id   = string
    node_count              = number
    enable_auto_scaling     = bool
    mode                    = string
    consumerapp_label       = string
  })
}



variable tags {

  type = map
    
}