variable "context" {
  type = object({

    application_name    = string
    environment_name    = string
    resource_group_name = string

    location            = object({
      name = string
      suffix = string
      number = number
    })

  })
}
# tier = "Standard"
# type = "GRS"
variable "service_settings" {
  type = object({

    name              = string
    tier              = string
    type              = string
    security_settings = object({
      allow_blob_public_access    = bool
      min_tls_version             = string
    })

  })
}
output service_settings_default {
  value = {
    tier = "Standard"
    type = "GRS"
    security_settings = {
      allow_blob_public_access = false 
      min_tls_version          = "TLS1_2"
    }

  }
}

# variable "security_settings" {
#   type = object({
#     allow_blob_public_access    = bool
#     min_tls_version             = string
#   })
#   default = {
#     allow_blob_public_access            = false
#     min_tls_version                     = "TLS1_2"
#   }

# }