data "azurerm_client_config" "current" {}

module "keyvault" {
  
  source                    = "github.com/markti/tf_azure_keyvault/vault/base_v2"

  application_name                  = var.context.application_name
  environment_name                  = var.context.environment_name
  
  name                      = "${var.context.application_name}-${var.context.environment_name}-${var.context.location_suffix}"
  resource_group_name       = var.context.resource_group_name
  location                  = var.context.location
  loganalytics_workspace_id = var.workspace_id

}


module "terraform_admin" {
  
  source                = "github.com/markti/tf_azure_keyvault/policy/machine/admin"

  keyvault_id           = module.keyvault.id
  application_id        = data.azurerm_client_config.current.client_id

}