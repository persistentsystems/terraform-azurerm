resource "azurerm_app_service_plan" "app_service_plan" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  kind                = "elastic"

  sku {
    tier = "ElasticPremium"
    size = "EP2"
    capacity = var.minimum_instance_count
  }

  maximum_elastic_worker_count = var.maximum_instance_count

  tags = {
    app = var.application_name
    env = var.environment_name
  }

}

module "func_storage" {
  
  source                = "github.com/markti/tf_azure_storage/blob/account"
  resource_group_name   = var.resource_group_name
  location              = var.location
  application_name              = var.application_name
  environment_name              = var.environment_name
  name                  = "func"

  type                  = var.storage_type

}