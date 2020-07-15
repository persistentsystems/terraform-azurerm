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