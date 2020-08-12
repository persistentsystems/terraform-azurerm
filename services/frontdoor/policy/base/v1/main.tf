resource "azurerm_frontdoor_firewall_policy" "waf" {
  name                              = "${var.service_settings.name}"
  resource_group_name               = var.context.resource_group_name
  enabled                           = true

  managed_rule { 
        type    = var.managed_rules_settings.type
        version = var.managed_rules_settings.version
      }
  
  #custom_rule {
      #name                           = var.custom_rules_settings.name
      #enabled                        = var.custom_rules_settings.enabled
      #priority                       = var.custom_rules_settings.priority
      #type                           = var.custom_rules_settings.type
      #action                         = var.custom_rules_settings.action
      #match_variable                 = var.custom_rules_settings.match_variable
      #operator                       = var.custom_rules_settings.operator
      #negation_condition             = var.custom_rules_settings.negation_condition
      #match_values                   = var.custom_rules_settings.match_values
      #rate_limit_duration_in_minutes = var.custom_rules_settings.rate_limit_duration_in_minutes
      #rate_limit_threshold           = var.custom_rules_settings.rate_limit_threshold
      #selector                       = var.custom_rules_settings.selector
      #trasnforms                     = var.custom_rules_settings.transforms
  #}

  tags = {
    app = var.context.application_name
    env = var.context.environment_name
  }  
}