module "api" {
  
  source                = "../../base/v1"
  
  context          = var.context
  service_settings = var.service_settings
  policies         = var.policies

}

module "fn_apim_backend" {
  
  source                = "../../../backend/fn/base/v1"
  
  context          = var.context
  
  service_settings = {
    endpoint_name         = var.service_settings.endpoint_name
    name                  = var.service_settings.name
  }
  backend_settings = {
    function_name         = var.function_name
    function_key          = var.function_key
    protocol              = "http"
  }

}