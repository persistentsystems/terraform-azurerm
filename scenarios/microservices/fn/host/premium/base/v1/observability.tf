

module "appinsights" {
  
  source                = "github.com/markti/tf_azure_appinsights/base"

  application_name              = var.context.application_name
  environment_name              = var.context.environment_name
  
  name                  = "${var.context.application_name}-${var.context.environment_name}-${var.context.location_suffix}"
  resource_group_name   = var.context.resource_group_name
  location              = var.context.location

}