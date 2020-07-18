resource "azurerm_storage_account" "storage_account" {

  name                      = "${var.service_settings.name}${random_string.random.result}"
  resource_group_name       = var.context.resource_group_name

  location                  = var.context.location
  account_tier              = var.service_settings.tier
  account_replication_type  = var.service_settings.type

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