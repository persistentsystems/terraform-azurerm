
resource "azurerm_subnet_network_security_group_association" "example" {
  subnet_id                 = var.service_settings.subnet_id
  network_security_group_id = var.service_settings
}

