variable "context" {
  type = object({

    application_name    = string
    environment_name    = string
    resource_group_name = string
    location            = string
    location_suffix     = string

  })
}
# tier = "Standard"
# type = "GRS"
variable "service_settings" {
  type = object({

    name                     = string
    account_tier             = string
    account_replication_type = string
    identity                 = string
    is_hns_enabled           = bool
    sftp_enabled             = bool
  })
}

variable "security_settings" {
  type = object({
    allow_blob_public_access    = bool
    min_tls_version             = string
  })
  default = {
    allow_blob_public_access            = false
    min_tls_version                     = "TLS1_2"
  }

}

variable tags {

  type = map
    
}

# variable "observability_settings" {
#   type = object({

#     instrumentation_key = string
#     workspace_id        = string
#     storage_account     = string 
#     retention_days      = number
#     workspace_name  = string
#   })
# }