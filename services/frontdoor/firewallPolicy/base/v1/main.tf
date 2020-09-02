resource "azurerm_frontdoor_firewall_policy" "waf" {
  name                              = var.service_settings.name
  resource_group_name               = var.context.resource_group_name
  enabled                           = true
  custom_block_response_status_code = var.policy_settings.custom_block_response_status_code
  custom_block_response_body        = var.policy_settings.custom_block_response_body
  mode                              = var.policy_settings.mode
  redirect_url                      = var.policy_settings.redirect_url

## Dynamic block logic
  dynamic "managed_rule" {
    for_each = var.managed_rules_settings
	
	  content {
	    type = managed_rule.value.type
		  version = managed_rule.value.version
            
    }
	}

  
  dynamic "custom_rule" {
    for_each = var.custom_rules_settings

    content {
      name                           = var.custom_rule.value.name
      enabled                        = var.custom_rule.value.enabled
      priority                       = var.custom_rule.value.priority
      rate_limit_duration_in_minutes = var.custom_rule.value.rate_limit_duration_in_minutes
      rate_limit_threshold           = var.custom_rule.value.rate_limit_threshold
      type                           = var.custom_rule.value.type
      action                         = var.custom_rule.value.action

    }
  }

  dynamic "match_condition" {
    for_each = var.match_condition
    content {
      match_variable             = var.match_condition.value.match_variable
      operator                   = var.match_condition.value.operator
      negation_condition         = var.match_condition.value.negation_condition
      match_values               = var.match_condition.value.match_values
    }
  }  
  
  tags = {
    app = var.context.application_name
    env = var.context.environment_name
     }  
}