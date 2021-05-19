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

    name                  = string
    tier                  = string
    kind                  = string
    failover_location     = string
    consistency_level     = string
    backup_type           = string
    interval_in_minutes   = number
    retention_in_hours    = number
  })
}

variable "observability_settings" {
  type = object({
    workspace_id              = string
    storage_account           = string 
    retention_days            = number
  })
}

variable tags {

  type = map
    
}