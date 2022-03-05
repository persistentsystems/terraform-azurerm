# resource "azurerm_private_dns_zone_virtual_network_link" "vnetdnszone" {
#   name                  = var.dns_zone_settings.name
#   private_dns_zone_name = var.dns_zone_settings.private_dns_zone_name
#   virtual_network_id    = var.dns_zone_settings.vnet_id
#   resource_group_name   = var.context.resource_group_name
# }