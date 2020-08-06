module "api" {
  
  source                = "../../base/v1"
  
  context          = var.context
  service_settings = {

    endpoint_name    = var.service_settings.endpoint_name
    name             = var.service_settings.name
    description      = var.service_settings.description
    revision         = var.service_settings.revision
    path             = var.service_settings.path
    primary_protocol = var.service_settings.primary_protocol
    publish          = var.service_settings.publish
    product_id       = var.service_settings.product_id
    backend_name     = module.backend.name

  }
  policies         = var.policies

}

module "backend" {
  
  source                = "../../../backend/fn/base/v1"
  
  context          = var.context
  
  service_settings = {
    endpoint_name         = var.service_settings.endpoint_name
    name                  = var.service_settings.name
  }
  backend_settings = {
    function_name         = var.backend_settings.function_name
    function_key          = var.backend_settings.function_key
    protocol              = var.backend_settings.protocol
  }

}