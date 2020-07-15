
resource "azurerm_resource_group" "rg" {

  name      = var.name
  location  = var.context.location

  tags = {
    app = var.context.application_name
    env = var.context.environment_name
  }

}