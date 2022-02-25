resource "azurerm_virtual_network_peering" "vnet-peering" {
  name                      = var.service_settings.name
  resource_group_name       = var.service_settings.resource_group_name
  virtual_network_name      = var.service_settings.virtual_network_name
  remote_virtual_network_id = var.service_settings.remote_virtual_network_id
}