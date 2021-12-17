#The ID of the subnet the app service will be associated to (the subnet must have a service_delegation configured for Microsoft.Web/serverFarms).
resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = var.context.resource_group_name
  virtual_network_name = var.vnet_name
  address_prefixes     = var.address_prefixes
  service_endpoints    = var.service_endpoints
  delegation {
    name = "${var.context.application_name}-delegation-${var.context.environment_name}"

    service_delegation {
      name    = "Microsoft.Web/serverFarms"
      actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
    }
  }
}