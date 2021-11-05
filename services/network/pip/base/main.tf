# public IP address
resource "azurerm_public_ip" "main" {

  name                = "pip-${var.name}"
  location            = var.context.location
  resource_group_name = var.name

  sku               = var.sku
  allocation_method = var.allocation_method
  domain_name_label = "${var.context.application_name}-sftp-${var.context.environment_name}"

  tags = {
    app = var.context.application_name
    env = var.context.environment_name
  }

}
resource "azurerm_virtual_network" "vnet" {
  name                = "${var.context.application_name}-${var.context.environment_name}-vnet"
  address_space       = ["10.1.0.0/16"]
  location            = var.context.location
  resource_group_name = var.context.resource_group_name
  tags = {
   app = var.context.application_name
   env = var.context.environment_name
  }
}
#The ID of the subnet the app service will be associated to (the subnet must have a service_delegation configured for Microsoft.Web/serverFarms).
resource "azurerm_subnet" "subnet" {
  name                 = "${var.context.application_name}-${var.context.environment_name}-fn-subnet"
  resource_group_name  = var.context.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.1.240.0/24"]
  service_endpoints    = ["Microsoft.KeyVault"]
  delegation {
    name = "${var.context.application_name}-delegation-${var.context.environment_name}"

    service_delegation {
      name    = "Microsoft.Web/serverFarms"
      actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
    }
  }
}