resource "azurerm_api_management_product" "product" {

  resource_group_name   = var.context.resource_group_name

  product_id            = var.service_settings.product_id
  api_management_name   = var.service_settings.endpoint_name
  display_name          = var.service_settings.description
  subscription_required = var.service_settings.subscription_required
  approval_required     = var.service_settings.approval_required
  published             = var.service_settings.publish

}