data "azurerm_client_config" "current" {}

data "azuread_service_principal" "service_account" {
  application_id = var.application_id
}

resource "azurerm_key_vault_access_policy" "policy" {
  key_vault_id = var.keyvault_id

  tenant_id = data.azurerm_client_config.current.tenant_id
  object_id = data.azuread_service_principal.service_account.object_id

  key_permissions = [
    "get",
  ]

  secret_permissions = [
    "get", "list"
  ]
}