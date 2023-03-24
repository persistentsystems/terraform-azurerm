resource "azurerm_storage_account_network_rules" "storage_network_rule" {
  storage_account_id         = var.service_settings.storage_account_id
  default_action             = var.service_settings.default_action
  ip_rules                   = var.service_settings.ip_rules
  virtual_network_subnet_ids = var.service_settings.virtual_network_subnet_ids
  bypass                     = ["AzureServices"]
}