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
  kind                = "elastic"

  sku {
    tier = "ElasticPremium"
    size = var.service_settings.size
    capacity = var.service_settings.minimum_instance_count
  }

  maximum_elastic_worker_count = var.service_settings.maximum_instance_count
  tags = local.final_tags

}

module "func_storage" {
  
  source                = "../../../../../../services/storage/endpoint/base/v1"
  context   = var.context

  service_settings = {
    name                  = "func"
    tier                  = "Standard"
    type                  = var.service_settings.storage_type
    identity             = "SystemAssigned"
  }
  tags = local.final_tags
}
