data "azurerm_client_config" "current" {}

resource "random_string" "random" {
  length = 5
  special = false
  lower = true
  upper = false
}

resource "azurerm_key_vault" "keyvault" {
  name                        = "${var.service_settings.name}-${random_string.random.result}"
  #name                       = "${var.service_settings.name}"

  location                    = var.context.location
  resource_group_name         = var.context.resource_group_name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  purge_protection_enabled    = false
  enabled_for_disk_encryption = true

  sku_name = "standard"

  network_acls {
    /*
    default_action = "Deny"
    */
    default_action = "Allow"
    bypass         = "AzureServices"
  }

  tags = {
    app = var.context.application_name
    env = var.context.environment_name
  }
}
