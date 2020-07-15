
module "storage_account" {
  
  source              = "../../base/v1"

  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location

  app_name            = var.app_name
  env_name            = var.env_name

  tier                = var.tier
  type                = var.type

}

module "secret_accesskey" {
  
  source                = "github.com/markti/tf_azure_keyvault/secret"

  keyvault_id           = var.keyvault_id
  
  name                  = "${var.secret_prefix}-ConnectionString"
  value                 = module.storage_account.primary_connection_string

  app_name              = var.app_name
  env_name              = var.env_name

}