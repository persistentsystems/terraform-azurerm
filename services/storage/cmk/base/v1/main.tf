resource "azurerm_storage_account_customer_managed_key" "cmk" {
  storage_account_id = var.service_settings.storage_account_id
  key_vault_id       = var.service_settings.key_vault_id
  key_name           = var.service_settings.key_name
}