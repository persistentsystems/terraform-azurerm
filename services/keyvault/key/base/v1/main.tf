##Use the below link as a reference for cmk implementation
##https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account_customer_managed_key
resource "azurerm_key_vault_key" "key" {
  name         = var.service_settings.name
  key_vault_id = var.service_settings.keyvault_id
  key_type     = "RSA"
  key_size     = 2048
  key_opts     = ["decrypt", "encrypt", "sign", "unwrapKey", "verify", "wrapKey"]
  expiration_date = var.service_settings.expiration_date

  # depends_on = [
  #   azurerm_key_vault_access_policy.client,
  #   azurerm_key_vault_access_policy.storage,
  # ]

  tags = {
    app = var.context.application_name
    env = var.context.environment_name
  }
}

