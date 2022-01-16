
resource "azurerm_subnet_network_security_group_association" "nsgassociation" {
  subnet_id                 = var.service_settings.subnet_id
  network_security_group_id = var.service_settings.nsg_id
}

