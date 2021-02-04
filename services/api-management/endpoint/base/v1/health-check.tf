
module "health_check_product" {

  source = "../../../product/base/v1"

  context = var.context
  service_settings = {

    endpoint = azurerm_api_management.apim.name

    product = {
      
      id                    = "health-check"
      description           = "Health Check"
      approval_required     = false
      subscription_required = false
      subscriptions_limit   = 0
      publish               = true

    }
  }
}


module "health_check_backend" {

  source = "../../../backend/base/v1"

  context                = var.context
  service_settings = {

    endpoint = azurerm_api_management.apim.name
    name     = "health-check-backend"

    backend = {
      
      protocol = "http"
      url      = "http://echoapi.cloudapp.net/api/resource"

    }
  }
}

module "health_check_api" {

  source = "../../../api/base/v1"

  context = var.context

  service_settings = {

    endpoint              = azurerm_api_management.apim.name
    logger                = azurerm_api_management_logger.app_insights.id

    api = {

      name                  = "health-check-api"
      description           = "Health Check - API"
      path                  = "health/api"
      revision              = "1"
      service_url           = ""
      
      products              = [ module.health_check_product.product_id ]
      subscription_required = false
      
      policies = {
        inbound  = ""
        outbound = ""
        backend  = ""
        error    = ""
      }
    }
  }
}


module "health_check_api_host" {

  source = "../../../op/base/v1"

  context = var.context
  service_settings = {

    endpoint = azurerm_api_management.apim.name
    api      = module.health_check_api.name

    op = {

      id          = "health-check-api-get"
      name        = "Health Check API"
      description = "Determines whether the API Management Service is available"
      method      = "GET"
      route       = "/"

      parameters = [ ]

      policies = {
        inbound  = <<XML
            <set-backend-service id="tf-generated-policy" backend-id="${module.health_check_backend.name}" />"
XML
        outbound = ""
        backend  = ""
        error    = ""
      }

    }
  }
}
