locals {
    default_tags = {
      app = var.context.application_name
      env = var.context.environment_name
    }

    final_tags = merge (local.default_tags, var.tags ) 
}
resource "azurerm_eventgrid_topic" "topic" {
    
  name                = var.service_settings.name
  location            = var.context.location
  resource_group_name = var.context.resource_group_name

  tags = local.final_tags

}