
data "azurerm_client_config" "current" {}

resource "azurerm_key_vault_access_policy" "storage" {
  key_vault_id    = var.service_settings.key_vault_id
  tenant_id       = data.azurerm_client_config.current.tenant_id
  object_id       = var.service_settings.object_id

  key_permissions    = ["get", "create", "delete", "list", "restore", "recover", "unwrapkey", "wrapkey", "purge", "encrypt", "decrypt", "sign", "verify"]
  secret_permissions = ["get"]
}