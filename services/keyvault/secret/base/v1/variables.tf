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

    keyvault_id     = string
    name            = string
    value           = string

  })
}
##Secrets expitation
# variable "secrets_expiration" {
#   type = string
#   default = "2022-03-01T00:00:00Z"
# }