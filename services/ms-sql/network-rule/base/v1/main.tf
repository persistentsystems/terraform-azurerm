resource "azurerm_mssql_virtual_network_rule" "sq_vnet_rule" {
  name      = var.vnet_rule.name
  server_id = var.vnet_rule.server_id
  subnet_id = var.vnet_rule.subnet_id
}