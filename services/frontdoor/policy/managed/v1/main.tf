module "firewall_policy" {

  source = "../../base/v1"

  context                = var.context
  service_settings       = local.service_settings

}

locals {
  
  service_settings = {
    
    enabled = var.service_settings.enabled
    policy  = var.service_settings.policy

    managed_rulesets = [
      {
        type = "DefaultRuleSet"
        version = "1.0"
      },
      {
        type = "Microsoft_BotManagerRuleSet"
        version = "1.0"
      }
    ]

    custom_rules = var.service_settings.custom_rules

  }

  
}