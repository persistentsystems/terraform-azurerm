resource "azurerm_key_vault_secret" "secret" {

  key_vault_id = var.service_settings.endpoint

  name         = var.service_settings.name
  value        = var.service_settings.value

  tags = {
    app = var.context.application_name
    env = var.context.environment_name
  }
  
}