variable "context" {
  type = object({

    application_name    = string
    environment_name    = string
    resource_group_name = string
    location            = string
    location_suffix     = string

  })
}
# tier = "Standard"
# kind = "GlobalDocumentDB"
# consistency_level = "Eventual"
variable "service_settings" {
  type = object({

    name              = string
    tier              = string
    kind              = string
    failover_location = string
    consistency_level = string
    log_storage_account = string

  })
}

variable "observability_settings" {
  type = object({
    workspace_id              = string
    storage_account           = string 
    retention_days            = number
  })
}
