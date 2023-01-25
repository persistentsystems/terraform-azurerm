resource "azurerm_monitor_diagnostic_setting" "storage_log_diagnostic_setting" {

  name                        = "${var.context.application_name}-${var.context.environment_name}-${var.observability_settings.name}-logs"
  target_resource_id          = "${var.observability_settings.target_resource_id}/blobServices/default"
  log_analytics_workspace_id  = var.observability_settings.workspace_id
  
  log {
    category = "StorageRead"
    enabled  = true

    retention_policy {
      enabled = false
    }
   }
   
   log {
    category = "StorageWrite"
    enabled  = true

    retention_policy {
      enabled = false
    }
   }
   
   log {
    category = "StorageDelete"
    enabled  = true

    retention_policy {
      enabled = false
    }
   }

  metric {
      category = "Transaction"
      enabled  = true 

      retention_policy {
        enabled = true
        days = 0
      }
  }

}

resource "azurerm_monitor_diagnostic_setting" "storage_storage_diagnostic_setting" {

  name                        = "${var.context.application_name}-${var.context.environment_name}-${var.observability_settings.name}-storage-logs"
  target_resource_id          = "${var.observability_settings.target_resource_id}/blobServices/default"
  storage_account_id          = var.observability_settings.storage_account

  log {
    category = "StorageRead"
    enabled  = true

    retention_policy {
      enabled = false
    }
   }
   
   log {
    category = "StorageWrite"
    enabled  = true

    retention_policy {
      enabled = false
    }
   }
   
   log {
    category = "StorageDelete"
    enabled  = true

    retention_policy {
      enabled = false
    }
   }

  metric {
      category = "Transaction"
      enabled  = true 

      retention_policy {
        enabled = true
        days = 0
      }
  }

}