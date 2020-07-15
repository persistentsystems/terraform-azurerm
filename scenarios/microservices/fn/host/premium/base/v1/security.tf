data "azurerm_client_config" "current" {}

module "keyvault" {
  
  source                    = "github.com/markti/tf_azure_keyvault/vault/base_v2"

  app_name                  = var.environment.app_name
  env_name                  = var.environment.env_name
  
  name                      = "${var.environment.app_name}-${var.environment.env_name}-${var.environment.location_suffix}"
  resource_group_name       = var.environment.resource_group_name
  location                  = var.environment.location
  loganalytics_workspace_id = var.workspace_id

}


module "terraform_admin" {
  
  source                = "github.com/markti/tf_azure_keyvault/policy/machine/admin"

  keyvault_id           = module.keyvault.id
  application_id        = data.azurerm_client_config.current.client_id

}