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

    name                = string
    short_name          = string

  })
}

variable "email_settings" {
    type = list(object({
      email_title    = string
      email_address = string
    }))
}