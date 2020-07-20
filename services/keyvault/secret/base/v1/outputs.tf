output "id" {
  value = azurerm_key_vault_secret.secret.id
}
output "name" {
  value = var.service_settings.name
}