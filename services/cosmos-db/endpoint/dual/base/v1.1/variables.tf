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
    workspace_id      = string

  })
}