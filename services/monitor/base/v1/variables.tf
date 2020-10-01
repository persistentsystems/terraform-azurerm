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
    webhook_name        = string
    service_uri         = string

  })
}

variable "metrics" {
  type = object({

    name               = string
    scopes             = string
    description        = string

  })
}

variable "parameters" {
  type = object({
    
    metric_namespace    = string
    metric_name         = string
    aggregation         = string
    operator            = string
    threshold           = string
    name                = string
    operator            = string
    values              = string

  })
}