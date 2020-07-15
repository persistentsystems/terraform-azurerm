
resource "azurerm_resource_group" "rg" {

  name      = var.environment.resource_group_name
  location  = var.environment.location

  tags = {
    app = var.environment.app_name
    env = var.environment.env_name
  }

}