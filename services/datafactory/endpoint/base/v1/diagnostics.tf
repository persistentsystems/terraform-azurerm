
resource "azurerm_monitor_diagnostic_setting" "diagnostic_setting" {

  name                        = "${var.service_settings.name}-adf-logs"
  target_resource_id          = azurerm_data_factory.datafactory.id
  log_analytics_workspace_id  = var.observability_settings.workspace_id

  log {
    category = "ActivityRuns"
    enabled  = true

    retention_policy {
      enabled = true
    }
  }

  log {
    category = "PipelineRuns"

    retention_policy {
      enabled = true
    }
  }

  log {
    category = "TriggerRuns"

    retention_policy {
      enabled = true
    }
  }

  log {
    category = "SSISPackageEventMessages"

    retention_policy {
      enabled = true
    }
  }

  log {
    category = "SSISPackageExecutableStatistics"

    retention_policy {
      enabled = true
    }
  }

  log {
    category = "SSISPackageEventMessageContext"

    retention_policy {
      enabled = true
    }
  }

  log {
    category = "SSISPackageExecutionComponentPhases"

    retention_policy {
      enabled = true
    }
  }

  log {
    category = "SSISPackageExecutionDataStatistics"

    retention_policy {
      enabled = true
    }
  }

  log {
    category = "SSISIntegrationRuntimeLogs"

    retention_policy {
      enabled = true
    }
  }

  metric {
    category = "AllMetrics"

    retention_policy {
      enabled = true
    }
  }

}