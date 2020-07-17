resource "azurerm_data_factory_linked_service_azure_blob_storage" "blob-strg-linkedsvc" {
  name                = var.service_settings.name
  resource_group_name = var.context.resource_group_name
  data_factory_name   = var.service_settings.data_factory_name
  connection_string   = var.service_settings.connection_string
}
