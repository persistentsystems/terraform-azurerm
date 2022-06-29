
variable "context" {
  type = object({

    application_name = string
    environment_name = string
    resource_group_name = string
    location = string
    location_suffix = string

  })
}


variable "service_settings" {
  type = object({
    name              = string
    automation_account_name = string
    frequency         = string
    interval          = number
    start_time        = string
    #timezone          =  string
    description       = string
    month_days        = list(string)

  })
}
