

module "appinsights" {
  
  source                = "github.com/markti/tf_azure_appinsights/base"

  app_name              = var.environment.app_name
  env_name              = var.environment.env_name
  
  name                  = "${var.environment.app_name}-${var.environment.env_name}-${var.environment.location_suffix}"
  resource_group_name   = var.environment.resource_group_name
  location              = var.environment.location

}