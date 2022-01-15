data "azurerm_client_config" "current" {}

data "azuread_service_principal" "service_account" {
  application_id = var.application_id
}

resource "azurerm_key_vault_access_policy" "storage" {
  key_vault_id = var.keyvault_id

  tenant_id = data.azurerm_client_config.current.tenant_id
  object_id = azurerm_storage_account.storage_account.identity.0.principal_id

  key_permissions    = ["get", "create", "list", "restore", "recover", "unwrapkey", "wrapkey", "purge", "encrypt", "decrypt", "sign", "verify"]
  secret_permissions = ["get"]
}