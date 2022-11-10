output "id" {
  value = azurerm_key_vault.keyvault.id
}
output "uri" {
  value = azurerm_key_vault.keyvault.vault_uri
}

output "name" {
  value = azurerm_key_vault.keyvault.name
}

output "secret_permissions" {
  value = azurerm_key_vault_access_policy.policy.secret_permissions 
}