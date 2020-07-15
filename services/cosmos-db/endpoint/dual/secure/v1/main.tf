module "account" {
  
  source           = "../../base/v1"

  context          = var.context
  service_settings = var.service_settings

}

module "secret_connection_string" {
  
  source                  = "../../../../../keyvault/secret/base/v1"

  service_settings {
    keyvault_id           = var.security_settings.keyvault_id
    name                  = "${var.security_settings.secret_prefix}-ConnectionString"
    value                 = module.account.connection_strings[0]
  }

  context                 = var.context

}