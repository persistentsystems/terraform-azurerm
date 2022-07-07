locals {
    default_tags = {
      app = var.context.application_name
      env = var.context.environment_name
    }

    final_tags = merge (local.default_tags, var.tags ) 
}
resource "azurerm_eventgrid_system_topic" "system_topic" {
    name                   = var.service_settings.name
    resource_group_name    = var.context.resource_group_name
    location               = var.context.location
    source_arm_resource_id = var.service_settings.source_arm_resource_id
    topic_type             = var.service_settings.topic_type
    tags                   = local.final_tags
}