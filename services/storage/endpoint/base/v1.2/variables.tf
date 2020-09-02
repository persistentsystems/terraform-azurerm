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

    name            = string
    tier            = string
    type            = string

  })
}

variable "allow_blob_public_access" {
  type = bool
  default = false
}

variable "min_tls_version" {
  type    = string
  default = "TLS1_2"
}