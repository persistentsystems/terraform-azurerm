
module "storage_account" {
  
  source              = "../../base/v1"

  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location

  application_name            = var.application_name
  environment_name            = var.environment_name

  tier                = var.tier
  type                = var.type

}

module "secret_accesskey" {
  
  source                = "github.com/markti/tf_azure_keyvault/secret"

  keyvault_id           = var.keyvault_id
  
  name                  = "${var.secret_prefix}-ConnectionString"
  value                 = module.storage_account.primary_connection_string

  application_name              = var.application_name
  environment_name              = var.environment_name

}