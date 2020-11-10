data "azurerm_client_config" "current" {}



module "terraform_admin" {
  
  source                    = "../../../../../../../services/keyvault/accesspolicy/templates/machine-admin/v1"

  keyvault_id               = var.service_settings.keyvault.id
  application_id            = data.azurerm_client_config.current.client_id

}
