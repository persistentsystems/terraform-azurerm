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

variable "metrics" {
  type = object({

    name               = string
    scopes             = string
    description        = string

  })
}

variable "parameters" {
  type = object({
    
    metric_namespace    = "Microsoft.Storage/storageAccounts"
    metric_name         = "Transactions"
    aggregation         = "Total"
    operator            = "GreaterThan"
    threshold           = "5"
    name                = "ApiName"
    operator            = "Include"
    values              = ["*"]

  })
}