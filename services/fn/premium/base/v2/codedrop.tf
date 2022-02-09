
resource "azurerm_storage_blob" "deployment_blob_linux" {
  name                    = "${var.service_settings.name}.zip"
  storage_account_name    = var.host_settings.deployment_storage_account_name
  storage_container_name  = var.host_settings.deployment_storage_container
  type                    = "Block"
  source                  = var.service_settings.package_filename
}