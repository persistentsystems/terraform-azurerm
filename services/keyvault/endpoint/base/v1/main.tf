data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "keyvault" {
  name                        = var.service_settings.name
  location                    = var.context.location
  resource_group_name         = var.context.resource_group_name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_enabled         = var.service_settings.soft_delete_enabled
  purge_protection_enabled    = false
  enabled_for_disk_encryption = true

  sku_name = "standard"

  network_acls {
    /*
    default_action = "Deny"
    */
    default_action = "Allow"
    bypass         = "AzureServices"
  }

  tags = {
    app = var.context.application_name
    env = var.context.environment_name
  }
}

resource "azurerm_monitor_diagnostic_setting" "keyvault_diagnostic_setting" {

  name                        = "${var.service_settings.name}-keyvault-logs"
  target_resource_id          = azurerm_key_vault.keyvault.id
  log_analytics_workspace_id  = var.service_settings.workspace_id

  log {
    category = "AuditEvent"
    enabled  = true

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