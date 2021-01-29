resource "azurerm_resource_group" "rg" {

  name      = "rg-${var.name}"
  location  = var.context.location.name

  tags = {
    app = var.context.application_name
    env = var.context.environment_name
  }

}