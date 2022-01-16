resource "azurerm_storage_account_customer_managed_key" "cmk" {
  storage_account_id = var.service_settings.storage_account_id
  key_vault_id       = var.service_settings.key_vault_id
  key_name           = var.service_settings.key_name
}

# data "azurerm_client_config" "current" {}

# resource "azurerm_key_vault_access_policy" "storage" {
#   key_vault_id    = var.service_settings.key_vault_id
#   tenant_id       = data.azurerm_client_config.current.tenant_id
#   object_id       = azurerm_storage_account.storage_account.identity.0.principal_id

#   key_permissions    = ["get", "create", "list", "restore", "recover", "unwrapkey", "wrapkey", "purge", "encrypt", "decrypt", "sign", "verify"]
#   secret_permissions = ["get"]
# }