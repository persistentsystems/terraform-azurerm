module "account" {
  
  source           = "../../base/v1"

  context                = var.context
  service_settings       = var.service_settings
  observability_settings = var.observability_settings

}

# The difference between this module and the base is here
# in the base the connection string is returned and may
# be passed around in terraform.  Here the connection string
# is put away in keyvault and not output from the module.
module "secret_connection_string" {
  
  source                  = "../../../../../keyvault/secret/base/v1"
  context                 = var.context

  service_settings = {
    endpoint              = var.security_settings.keyvault_id
    name                  = "${var.security_settings.secret_prefix}-ConnectionString"
    value                 = module.account.connection_strings[0]
  }


}