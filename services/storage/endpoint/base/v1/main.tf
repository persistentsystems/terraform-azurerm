
locals {
  # remove hypens
  clean_name = replace(var.service_settings.name, "-", "")
}

resource "azurerm_storage_account" "storage_account" {

  name                      = "st${local.clean_name}"
  resource_group_name       = var.context.resource_group_name

  location                  = var.context.location.name
  account_tier              = var.service_settings.tier
  account_replication_type  = var.service_settings.type
  allow_blob_public_access  = var.service_settings.security_settings.allow_blob_public_access
  min_tls_version           = var.service_settings.security_settings.min_tls_version

  tags = {
    app = var.context.application_name
    env = var.context.environment_name
  }

}

resource "null_resource" "storage_logging" {
  provisioner "local-exec" {
    command = "az storage logging update --log rwd --retention 0 --services b --version 2.0 --account-name ${azurerm_storage_account.storage_account.name} --account-key ${azurerm_storage_account.storage_account.primary_access_key}"
  }
}

resource "null_resource" "storage_metrics" {
  provisioner "local-exec" {
    command = "az storage metrics update --account-name ${azurerm_storage_account.storage_account.name} --api true --hour true --minute true --retention 0 --services b --account-key ${azurerm_storage_account.storage_account.primary_access_key}"
  }
}