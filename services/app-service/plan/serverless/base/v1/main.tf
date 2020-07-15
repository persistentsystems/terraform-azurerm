resource "azurerm_app_service_plan" "app_service_plan" {
  name                = var.service_settings.name
  location            = var.context.location
  resource_group_name = var.context.resource_group_name
  kind                = "FunctionApp"

  sku {
    tier = "Dynamic"
    size = "Y1"
  }

  tags = {
    app = var.context.app_name
    env = var.context.env_name
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