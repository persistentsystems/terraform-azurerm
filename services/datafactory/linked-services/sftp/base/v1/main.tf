resource "azurerm_data_factory_linked_service_sftp" "sftp-linkedsvc" {
  name                = var.service_settings.name
  resource_group_name = var.context.resource_group_name
  data_factory_name   = var.service_settings.data_factory_name
  authentication_type = var.service_settings.authentication_type
  host                = var.service_settings.host
  port                = var.service_settings.port
  username            = var.service_settings.username
  password            = var.service_settings.password
}
