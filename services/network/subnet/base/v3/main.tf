#The ID of the subnet the app service will be associated to (the subnet must have a service_delegation configured for Microsoft.Web/serverFarms).
resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = var.context.resource_group_name
  virtual_network_name = var.vnet_name
  address_prefixes     = var.address_prefixes
  
}