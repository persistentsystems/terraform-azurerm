resource "azurerm_application_insights" "main" {

  name                = var.service_settings.name
  location            = var.context.location
  resource_group_name = var.context.resource_group_name
  application_type    = "web"

  retention_in_days   = var.service_settings.retention_days

  tags = {
    app = var.context.application_name
    env = var.context.environment_name
  }
  
}