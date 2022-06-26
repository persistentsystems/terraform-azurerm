locals {
    default_tags = {
      app = var.context.application_name
      env = var.context.environment_name
    }

    final_tags = merge (local.default_tags, var.tags ) 
}
resource "random_string" "random" {
  length = 8
  special = false
  lower = true
  upper = false
}

resource "azurerm_automation_account" "account" {
  name                = "${var.service_settings.name}-${random_string.random.result}"
  location            = var.context.location
  resource_group_name = var.context.resource_group_name

  sku_name = var.service_settings.sku_name
  tags = local.final_tags
}