resource "azurerm_data_factory" "datafactory" {
  name                = var.service_settings.name
  location            = var.environment.location
  resource_group_name = var.environment.resource_group_name

  tags = {
    app = var.environment.app_name
    env = var.environment.env_name
  }
}