
resource "azurerm_resource_group" "rg" {

  name      = var.service_settings.resource_group_name
  location  = var.context.location

  tags = {
    app = var.context.application_name
    env = var.context.environment_name
  }

}