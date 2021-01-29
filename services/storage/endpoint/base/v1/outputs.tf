output "id" {
  value = azurerm_storage_account.storage_account.id
}
output "name" {
  value = azurerm_storage_account.storage_account.name
}
output "primary_access_key" {
  value = azurerm_storage_account.storage_account.primary_access_key
}
output "primary_endpoint" {
  value = azurerm_storage_account.storage_account.primary_blob_endpoint
}
output "primary_connection_string" {
  value = azurerm_storage_account.storage_account.primary_connection_string
}
output "storage_account" {
  value = azurerm_storage_account.storage_account
}