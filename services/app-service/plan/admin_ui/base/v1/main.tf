locals {
    default_tags = {
      app = var.context.application_name
      env = var.context.environment_name
    }

    final_tags = merge (local.default_tags, var.tags ) 
}
resource "azurerm_app_service_plan" "app_service_plan" {
  name                = var.service_settings.name
  location            = var.context.location
  resource_group_name = var.context.resource_group_name
  kind                = "app"

  sku {
    tier = var.service_settings.tier
    size = var.service_settings.size
    capacity = var.service_settings.minimum_instance_count
  }  
  tags = local.final_tags

}