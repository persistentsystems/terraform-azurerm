variable "context" {
  type = object({

    application_name    = string
    environment_name    = string
    resource_group_name = string

    location            = object({
      name = string
      suffix = string
      number = number
    })

  })
}

variable "observability_settings" {
  type = object({
    
    instrumentation_key = string
    workspace_id        = string
    storage_account     = string

    retention_policy = object({
    
      short_term = number
      long_term  = number

    })

    action_groups = object({
      critical = list(string)
      high     = list(string)
      moderate = list(string)
    })

  })
}

# tier = "Standard"
# kind = "GlobalDocumentDB"
# consistency_level = "Eventual"
variable "service_settings" {
  type = object({

    name               = string
    tier               = string
    kind               = string
    consistency_level  = string
    automatic_failover = bool

    locations = list(object({
      name     = string
      priority = number
    }))

  })
}

variable "security_settings" {
  type = object({
    secret_prefix     = string
    keyvault_id       = string
  })
}
