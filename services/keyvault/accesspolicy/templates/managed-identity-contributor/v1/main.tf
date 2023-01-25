data "azurerm_client_config" "current" {}

resource "azurerm_key_vault_access_policy" "policy" {
  key_vault_id = var.keyvault_id

  tenant_id = data.azurerm_client_config.current.tenant_id
  object_id = var.object_id

  key_permissions = [
    "get", "create", "delete", "list", "restore", "update", "import", "recover", "backup"
  ]

  secret_permissions = [
    "get", "list", "set", "delete", "backup"
  ]

  certificate_permissions = [
    "get", "list"
  ]
  
}