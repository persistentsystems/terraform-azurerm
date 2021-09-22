resource "azurerm_key_vault_secret" "secret" {
  name         = var.service_settings.name
  value        = var.service_settings.value
  key_vault_id = var.service_settings.keyvault_id
  #expiration_date = var.secrets_expiration

  tags = {
    app = var.context.application_name
    env = var.context.environment_name
  }
}