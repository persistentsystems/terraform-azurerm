
locals {
  # remove hypens
  clean_name = replace(var.context.application_name, "-", "")
}

resource "azurerm_frontdoor_firewall_policy" "firewall_policy" {

  resource_group_name               = var.context.resource_group_name
  name                              = "waf${local.clean_name}${random_string.random.result}"
  enabled                           = var.service_settings.enabled

  custom_block_response_status_code = var.service_settings.policy.custom_block_response_status_code
  custom_block_response_body        = var.service_settings.policy.custom_block_response_body
  mode                              = var.service_settings.policy.mode
  redirect_url                      = var.service_settings.policy.redirect_url

  ## Dynamic block logic
  dynamic "managed_rule" {    
    for_each = var.service_settings.managed_rulesets
    
    content {
	    type = managed_rule.value.type
	    version = managed_rule.value.version
    }

  }
  
  dynamic "custom_rule" {
    for_each = var.service_settings.custom_rules

    content {
      name                           = custom_rule.value.name
      enabled                        = custom_rule.value.enabled
      priority                       = custom_rule.value.priority
      rate_limit_duration_in_minutes = custom_rule.value.rate_limit_duration_in_minutes
      rate_limit_threshold           = custom_rule.value.rate_limit_threshold
      type                           = custom_rule.value.type
      action                         = custom_rule.value.action

      match_condition {
        match_variable             = custom_rule.value.match_variable
        operator                   = custom_rule.value.operator
        negation_condition         = custom_rule.value.negation_condition
        match_values               = custom_rule.value.match_values
      } 
    }
  }
 
  tags = {
    app = var.context.application_name
    env = var.context.environment_name
   }

}


resource "random_string" "random" {
  length = 8
  special = false
  lower = true
  upper = false
}
