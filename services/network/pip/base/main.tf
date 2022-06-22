# public IP address
resource "azurerm_public_ip" "main" {

  name                = "pip-${var.name}"
  location            = var.context.location
  resource_group_name = var.name

  sku               = var.sku
  allocation_method = var.allocation_method
  domain_name_label = "${var.context.application_name}-sftp-${var.context.environment_name}"
  availability_zone = var.availability_zone

  tags = {
    app = var.context.application_name
    env = var.context.environment_name
  }

}