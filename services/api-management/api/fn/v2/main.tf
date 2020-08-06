module "api" {
  
  source                = "../../base/v2"
  
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
    backend1_name     = module.backend1.name
    backend2_name     = module.backend2.name

  }
  policies         = var.policies

}

resource "random_string" "random1" {
  length = 4
  special = false
  lower = true
  upper = false
}   
    
resource "random_string" "random2" {
  length = 6
  special = false
  lower = true
  upper = false
} 
    
    
    
module "backend1" {
  
  source                = "../../../backend/fn/base/v1"
  
  context          = var.context
  
  service_settings = {
    endpoint_name         = var.service_settings.endpoint_name
    name                  = "${var.service_settings.name}${random_string.random1.result}"
  }
  backend_settings = {
    function_name         = var.backend1_settings.function_name
    function_key          = var.backend1_settings.function_key
    protocol              = var.backend1_settings.protocol
  }

}

module "backend2" {
  
  source                = "../../../backend/fn/base/v1"
  
  context          = var.context
  
  service_settings = {
    endpoint_name         = var.service_settings.endpoint_name
    name                  = "${var.service_settings.name}${random_string.random2.result}"
  }
  backend_settings = {
    function_name         = var.backend2_settings.function_name
    function_key          = var.backend2_settings.function_key
    protocol              = var.backend2_settings.protocol
  }

}
