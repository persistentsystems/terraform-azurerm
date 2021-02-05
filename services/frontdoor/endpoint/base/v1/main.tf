locals {
  frontdoor_service_name = "fd-${var.service_settings.name}"
}

resource "azurerm_frontdoor" "frontdoor" {
  name                                         = local.frontdoor_service_name
  resource_group_name                          = var.context.resource_group_name

  enforce_backend_pools_certificate_name_check = false

  tags = {
    app = var.context.application_name
    env = var.context.environment_name
  }

  frontend_endpoint {
    name                                    = "DefaultEndpoint"
    host_name                               = "${local.frontdoor_service_name}.azurefd.net"
    custom_https_provisioning_enabled       = false
    web_application_firewall_policy_link_id = var.service_settings.waf_id
  
  }

  # default routing rule for each backend pool
  dynamic "routing_rule" {
    for_each = var.service_settings.pools
      content {

        name               = "PrimaryRoutingRules"
        accepted_protocols = [ "Https" ]
        patterns_to_match  = [ "/*" ]
        frontend_endpoints = [ "DefaultEndpoint" ]
        forwarding_configuration {
          forwarding_protocol = "MatchRequest"
          backend_pool_name   = routing_rule.value.name
        }

      }
  }

  dynamic "backend_pool" {
    for_each = var.service_settings.pools
      content {
        
        name = backend_pool.value.name

        dynamic "backend" {
          for_each = backend_pool.value.backends
            content {
              host_header = backend.value.host_header
              address     = backend.value.address
              http_port   = backend.value.http_port
              https_port  = backend.value.https_port
              weight      = backend.value.weight
            }
        }
        
        load_balancing_name = backend_pool.value.name
        health_probe_name   = backend_pool.value.name

      }
  }
  
  dynamic "backend_pool_load_balancing" {
    for_each = var.service_settings.pools
      content {
        name = backend_pool_load_balancing.value.name
        additional_latency_milliseconds = backend_pool_load_balancing.value.latency
      }
  }

  dynamic "backend_pool_health_probe" {
    for_each = var.service_settings.pools
      content {
        name      = backend_pool_health_probe.value.name
        protocol  = "Https"
        path      = backend_pool_health_probe.value.healthprobe_path
      }
  }

}