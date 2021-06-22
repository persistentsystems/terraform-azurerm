locals {
    default_tags = {
      app = var.context.application_name
      env = var.context.environment_name
    }

    final_tags = merge (local.default_tags, var.tags ) 
}

resource "azurerm_storage_account" "storage_account" {

  name                      = "${var.service_settings.name}${random_string.random.result}"
  resource_group_name       = var.context.resource_group_name

  location                  = var.context.location
  account_tier              = var.service_settings.tier
  account_replication_type  = var.service_settings.type
  allow_blob_public_access  = var.security_settings.allow_blob_public_access
  min_tls_version           = var.security_settings.min_tls_version

  tags                      = local.final_tags

}
/*
resource "azurerm_storage_account_network_rules" "storage_account" {
  resource_group_name  = var.context.resource_group_name
  storage_account_name = azurerm_storage_account.storage_account.name

  default_action             = "Deny"  
  ip_rules                   = ["40.121.0.0/16"] 
}
*/

resource "random_string" "random" {
  length = 8
  special = false
  lower = true
  upper = false
}

resource "null_resource" "storage-logging" {
  provisioner "local-exec" {
    command = "az storage logging update --log rwd --retention 0 --services b --version 2.0 --account-name ${azurerm_storage_account.storage_account.name} --account-key ${azurerm_storage_account.storage_account.primary_access_key}"
  }
}

resource "null_resource" "storage-metrics" {
  provisioner "local-exec" {
    command = "az storage metrics update --account-name ${azurerm_storage_account.storage_account.name} --api true --hour true --minute true --retention 0 --services b --account-key ${azurerm_storage_account.storage_account.primary_access_key}"
  }
}