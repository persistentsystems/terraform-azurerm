output "id" {
  value = azurerm_key_vault_key.key.id
}
output "name" {
  value = var.service_settings.name
}

