variable "environment" {
  type = object({

    app_name            = string
    env_name            = string
    resource_group_name = string
    location            = string
    location_suffix     = string

  })
}
variable "apim_settings" {
  type = object({

    name            = string
    publisher_name  = string
    publisher_email = string
    sku_name        = string

  })
}
variable "cors_settings" {
  type = object({

    allowed_origins = list(string)
    allowed_headers = list(string)

  })
}