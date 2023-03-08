locals {
    default_tags = {
      app = var.context.application_name
      env = var.context.environment_name
    }

    final_tags = merge (local.default_tags, var.tags ) 
}
data "azurerm_client_config" "current" {}

resource "random_string" "random" {
  length = 5
  special = false
  lower = true
  upper = false
}
resource "azurerm_key_vault_access_policy" "policy" {
  key_vault_id = azurerm_key_vault.keyvault.id

  tenant_id = data.azurerm_client_config.current.tenant_id
  object_id = data.azurerm_client_config.current.object_id


  certificate_permissions = [
    "Get", "Create", "List", "Delete", "Update"
  ]

  key_permissions = [
    "get", "list","create","delete", "backup", "update", "restore", "recover", "unwrapkey", "wrapkey", "purge", "encrypt", "decrypt", "sign", "verify"
  ]
  secret_permissions = [
    "get", "list" , "set", "delete", "purge", "restore", "Recover", "backup"
  ]

  storage_permissions = [
    "get", "set", "list", "delete"
  ]

}

resource "azurerm_key_vault" "keyvault" {
  name                        = "${var.service_settings.name}-${random_string.random.result}"
  #name                       = "${var.service_settings.name}"
  location                    = var.context.location
  resource_group_name         = var.context.resource_group_name
  tenant_id                   = data.azurerm_client_config.current.tenant_id  
  soft_delete_retention_days  = var.soft_delete_retention_days 
  purge_protection_enabled    = true
  enabled_for_disk_encryption = true
  sku_name = "standard"

  network_acls {
 
    default_action = "Deny"
    #default_action = "Allow"
    bypass         = "AzureServices"
    virtual_network_subnet_ids = tolist(var.service_settings.virtual_network_subnet_ids)
  }

  tags = local.final_tags

}
