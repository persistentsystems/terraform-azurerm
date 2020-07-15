variable "environment" {
  type = object({

    app_name            = string
    env_name            = string
    resource_group_name = string
    location            = string
    location_suffix     = string

  })
}