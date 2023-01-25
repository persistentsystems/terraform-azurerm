variable "context" {
  type = object({
    application_name    = string
    environment_name    = string
    resource_group_name = string
    location            = string
    location_suffix     = string
  })
}
variable "criteria_settings" {
    type = object({
        metric_namespace    = string
        metric_name         = string
        aggregation         = string
        operator            = string
        threshold           = string
        dimension_name      = string
        dimension_operator  = string
        values              = list(string)
        window_size         = string
        frequency           = string
    }) 
}

variable "alert_settings" {
  type =object({
    name   =string
    scopes = list(string)
    description = string
    severity    = number
  })
}