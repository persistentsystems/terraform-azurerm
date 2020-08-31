resource "azurerm_storage_container" "container" {
  name                  = var.name
  storage_account_name  = var.storage_account_name
  container_access_type = var.access_type

    logging {
      delete                = true
      read                  = true
      write                 = true
      version               = var.storage_version
      retention_policy_days = var.retention_policy
    }
  
    hour_metrics {
      enabled               = true
      include_apis          = true
      version               = var.storage_version
      retention_policy_days = var.retention_policy
    }

    minute_metrics {
      enabled               = true
      include_apis          = true
      version               = var.storage_version
      retention_policy_days = var.retention_policy
    }
}
