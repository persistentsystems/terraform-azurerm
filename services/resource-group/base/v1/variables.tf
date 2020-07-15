variable "context" {
  type = object({

    application_name    = string
    environment_name    = string
    location            = string
    location_suffix     = string

  })
}
variable "name" { }