data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "keyvault" {

  location                    = var.context.location.name
  resource_group_name         = var.context.resource_group_name

  name                        = "kv-${var.service_settings.name}"

  tenant_id                   = data.azurerm_client_config.current.tenant_id
  purge_protection_enabled    = false
  enabled_for_disk_encryption = true

  sku_name                    = "standard"

  # allow terraform user basic access
  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    certificate_permissions = [
      "get", "create", "list", "delete", "update"
    ]

    key_permissions = [
      "get", "create", "list", "delete"
    ]

    secret_permissions = [
      "get", "set", "list", "delete"
    ]

    storage_permissions = [
      "get", "set", "list", "delete"
    ]
  }

  network_acls {
    default_action = "Allow"
    bypass         = "AzureServices"
  }

  tags = {
    app = var.context.application_name
    env = var.context.environment_name
  }
}
