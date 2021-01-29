resource "azurerm_log_analytics_workspace" "workspace" {
  name                = "log-${var.service_settings.name}"
  location            = var.context.location.name
  resource_group_name = var.context.resource_group_name
  sku                 = var.service_settings.sku
  retention_in_days   = var.service_settings.retention_in_days

  tags = {
    app = var.context.application_name
    env = var.context.environment_name
  }
}