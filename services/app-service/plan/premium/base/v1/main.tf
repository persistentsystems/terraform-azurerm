resource "azurerm_app_service_plan" "app_service_plan" {
  name                = var.service_settings.name
  location            = var.context.location
  resource_group_name = var.context.resource_group_name
  kind                = "elastic"

  sku {
    tier = "ElasticPremium"
    size = "EP2"
    capacity = var.service_settings.minimum_instance_count
  }

  maximum_elastic_worker_count = var.service_settings.maximum_instance_count

  tags = {
    app = var.context.application_name
    env = var.context.environment_name
  }

}

module "func_storage" {
  
  source                = "../../../../../../services/storage/endpoint/base/v1"
  context   = var.context

  service_settings = {
    name                  = "func"
    tier                  = "Standard"
    type                  = var.service_settings.storage_type
  }

}
  
resource "null_resource" "cli-funcdatastorage-log" {
  provisioner "local-exec" {
    command = "az storage logging update --log rwd --retention 365 --services b --version 2.0 --account-name ${module.func_storage.name} --account-key ${module.func_storage.primary_access_key}"
  }
}

resource "null_resource" "cli-funcdatastorage-metrics" {
  provisioner "local-exec" {
    command = "az storage metrics update --account-name ${module.func_storage.name} --api true --hour true --minute true --retention 365 --services b --account-key ${module.func_storage.primary_access_key}"
  }
}
