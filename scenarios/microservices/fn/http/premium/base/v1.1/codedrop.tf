
locals {

  code_drop_prefix = "https://${var.host_settings.deployment_storage_account_name}.blob.core.windows.net/${var.host_settings.deployment_storage_container}"
  code_drop_url = "${local.code_drop_prefix}/${azurerm_storage_blob.deployment_blob.name}${var.host_settings.deployment_package_sas}"

}

resource "azurerm_storage_blob" "deployment_blob" {
  name                    = "${var.service_settings.name}.zip"
  storage_account_name    = var.host_settings.deployment_storage_account_name
  storage_container_name  = var.host_settings.deployment_storage_container
  type                    = "Block"
  source                  = var.service_settings.package_filename
}