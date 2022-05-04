data "azurerm_subscription" "primary" {
}

resource "azurerm_role_definition" "role_def" {
  name        = var.service_settings.name
  scope       = data.azurerm_subscription.primary.id
  description = var.service_settings.description

  permissions {
    actions     = var.service_settings.actions
  }

  assignable_scopes = [
    data.azurerm_subscription.primary.id
  ]
}