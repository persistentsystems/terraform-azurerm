resource "azurerm_frontdoor" "frontdoor" {
  name                                         = var.service_settings.name
  resource_group_name                          = var.context.resource_group_name

  enforce_backend_pools_certificate_name_check = false

  tags = {
    app = var.context.application_name
    env = var.context.environment_name
  }

  frontend_endpoint {
    name                              = "DefaultEndpoint"
    host_name                         = "${var.service_settings.name}.azurefd.net"
    custom_https_provisioning_enabled = false

  }

  backend_pool_load_balancing {
    name = var.backend_settings.name
    additional_latency_milliseconds = 1000
  }

  backend_pool_health_probe {
    name      = var.backend_settings.name
    protocol  = "Https"
    path      = var.backend_settings.healthprobe_path
  }

  
  # PRIMARY
  routing_rule {
    name               = "PrimaryRoutingRules"
    accepted_protocols = [ "Https" ]
    patterns_to_match  = [ "/*" ]
    frontend_endpoints = [ "DefaultEndpoint" ]
    forwarding_configuration {
      forwarding_protocol = "MatchRequest"
      backend_pool_name   = "PrimaryBackend"
    }
  }

  backend_pool {

    name = "PrimaryBackend"

    backend {
      host_header = var.primary_backend.host_header
      address     = var.primary_backend.address
      http_port   = var.primary_backend.http_port
      https_port  = var.primary_backend.https_port
      weight      = 50
    }

    backend {
      host_header = var.secondary_backend.host_header
      address     = var.secondary_backend.address
      http_port   = var.secondary_backend.http_port
      https_port  = var.secondary_backend.https_port
      weight      = 50
    }

    load_balancing_name = var.backend_settings.name
    health_probe_name   = var.backend_settings.name

  }

  web_application_firewall_policy_link_settings {
    web_application_firewall_policy_link_id = var.web_application_firewall_policy_link_settings.web_application_firewall_policy_link_id
  }
}