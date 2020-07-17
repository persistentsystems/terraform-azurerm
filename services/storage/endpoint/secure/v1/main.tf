
module "storage_account" {
  
  source              = "../../base/v1"

  context = var.context

  service_settings {

    name                = var.service_settings.name
    tier                = var.service_settings.tier
    type                = var.service_settings.type
  
  }

}

module "secret_accesskey" {
  
  source                = "github.com/persistentsystems/terraform-azurerm/services/keyvault/secret/base/v1"

  context = var.context

  service_settings {

    keyvault_id           = var.service_settings.keyvault_id
    name                  = "${var.service_settings.secret_prefix}-ConnectionString"
    value                 = module.storage_account.primary_connection_string
  
  }

}