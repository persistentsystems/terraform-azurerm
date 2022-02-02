output "principal_id" {
  value = azurerm_key_vault_access_policy.storage.object_id
}