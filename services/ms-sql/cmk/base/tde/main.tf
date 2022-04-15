resource "azurerm_mssql_server_transparent_data_encryption" "tde" {
  server_id             = var.service_settings.server_id
  key_vault_key_id      = var.service_settings.key_vault_key_id
}